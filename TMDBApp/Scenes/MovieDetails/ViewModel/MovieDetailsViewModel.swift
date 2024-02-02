//
//  MovieDetailsViewModel.swift
//  TMDBApp
//
//  Created by Ahmed Ali on 02/02/2024.
//

import Domain
import Combine

final class MovieDetailsViewModel {
    // MARK: - Properties
    let useCase: FetchMovieDetailsUseCase
    private var movie: MovieDetailsUIModel?

    /// Property for managing the view state.
    @Published private var state: ViewState = .idle
    /// A subject for triggering  view reload.
    let reloadView = PassthroughSubject<Void, Never>()

    private var movieId: Int

    // MARK: - Init
    /// Initializes the ViewModel with the specified use case.
    /// - Parameter
    ///  - coordinator: A coordinator responsible for navigation.
    ///  - useCase: The use case for fetching movies.
    ///
    init(useCase: FetchMovieDetailsUseCase,
         movieId: Int) {
        self.useCase = useCase
        self.movieId = movieId
    }
}
// MARK: - ViewModelProtocol
extension MovieDetailsViewModel: ViewModelProtocol {
    /// A publisher that emits the view state changes.
    var statePublisher: AnyPublisher<ViewState, Never> {
        $state.eraseToAnyPublisher()
    }
}
// MARK: - MovieDetailsViewModelInput
extension MovieDetailsViewModel: MovieDetailsViewModelInput {
    /// Fetches movie details using the associated use case.
    func fetchMovieDetails() {
        self.state = .loading
        Task {
            do {
                let result = try await useCase.execute(by: self.movieId)
                self.movie = MovieDetailsUIModel(from: result)
                self.state = .idle
                self.reloadView.send()
            } catch {
                await onReceiveError(error)
            }
        }
    }
}
// MARK: - MovieDetailsViewModelOutput
extension MovieDetailsViewModel: MovieDetailsViewModelOutput {

    var moviePosterPath: String? {
        movie?.imageURL
    }
    var movieTitle: String? {
        movie?.title
    }
    var movieOverview: String? {
        movie?.overview
    }
    var movieReleaseDate: String? {
        movie?.releaseDate
    }
    var movieProductionCompanies: String? {
        movie?.productionCompanies
    }
    var movieProductionCountries: String? {
        movie?.productionCountries
    }
    var screenTitle: String {
        Constants.screenTitle
    }
}

// MARK: - Private Handler(s)
private extension MovieDetailsViewModel {
    /// Handles error cases by updating the view state to indicate an error on the `Main Thread`.
    /// - Parameter error: The error that occurred.
    @MainActor
    func onReceiveError(_ error: Error) {
        self.state = .error(error)
    }
}
// MARK: - Constants
private extension MovieDetailsViewModel {
    /// Constants used in the MoviesListViewModel.
    enum Constants {
        static let screenTitle = "Movie Details"
    }
}
