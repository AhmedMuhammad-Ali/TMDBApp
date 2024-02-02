//
//  MoviesListViewModel.swift
//  TMDBApp
//
//  Created by Ahmed Ali on 31/01/2024.
//

import Combine
import Domain

/// ViewModel for managing the list of movies.
final class MoviesListViewModel {
    // MARK: - Properties
    let useCase: FetchAllMoviesUseCase
    private var movies: Movies?
    private var pages: [MoviesPage] = []
    private let pagingManager = PagingManager()

    /// Property for managing the view state.
    @Published private var state: ViewState = .idle
    /// A subject for triggering a table view reload.
    let reloadTableView = PassthroughSubject<Void, Never>()
    // MARK: - Coordinator
    /// Coordinator for navigating to other screens.
    private weak var coordinator: HomeCoordinatorContact?

    // MARK: - Init
    /// Initializes the ViewModel with the specified use case.
    /// - Parameter
    ///  - coordinator: A coordinator responsible for navigation.
    ///  - useCase: The use case for fetching movies.
    ///
    init(coordinator: HomeCoordinatorContact,
         useCase: FetchAllMoviesUseCase) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
}
// MARK: - ViewModelProtocol
extension MoviesListViewModel: ViewModelProtocol {
    /// A publisher that emits the view state changes.
    var statePublisher: AnyPublisher<ViewState, Never> {
        $state.eraseToAnyPublisher()
    }
}
// MARK: - MoviesListViewModelInput
extension MoviesListViewModel: MoviesListViewModelInput {
    /// Handles the selection of a movie at a given index.
    /// - Parameter index: The index of the selected movie.
    func didTappedOnMovie(at index: Int) {
        guard let movieId = movies?[safe: index]?.id else { return }
        coordinator?.showMovieDetails(with: movieId)
    }
    func fetchAllMovies() {
        performMovieFetch()

        Task {
            do {
                let moviesPage = try await useCase.execute(for: pagingManager.nextPageIndex)
                await updateUI(with: moviesPage)
            } catch {
                await onReceiveError(error)
            }
        }
    }
}

// MARK: - MoviesListViewModelOutput
extension MoviesListViewModel: MoviesListViewModelOutput {
    var moviesCount: Int {
        self.movies?.count ?? .zero
    }

    var screenTitle: String {
        Constants.screenTitle
    }

    subscript(index: Int) -> MovieTableViewCell.ViewModel? {
        movies?[safe: index]
    }
}
// MARK: - Private Handler(s)
private extension MoviesListViewModel {

    /// Performs the movie fetch operation if the next page should be loaded, updating the paging manager and view state accordingly.
    func performMovieFetch() {
        guard pagingManager.shouldLoadNextPage else { return }
        pagingManager.startLoadingNextPage()

        state = pagingManager.isFirstPage ? .loading : .idle
    }
    /// Updates the paging manager with the total number of pages and marks the current page as loaded.
    /// - Parameter totalPages: The total number of pages in the data set.
    func updatePagingManager(with totalPages: Int) {
        pagingManager.updateTotalNumberOfPages(totalPages)
        pagingManager.loadedPage()
    }

    /// Updates the UI with the provided movies page, including updating the pages array, movies array, paging manager, and view state.
    /// - Parameter moviesPage: The page of movies to update the UI with.
    @MainActor
    func updateUI(with moviesPage: MoviesPage) {
        pages = pages.filter { $0.page != moviesPage.page } + [moviesPage]
        self.movies = pages.flatMap { $0.movies.map { .init(movie: $0)} }
        updatePagingManager(with: moviesPage.totalPages)
        updateViewState()
    }

    /// Updates the view state based on the current state of the movies array and triggers a table view reload.
    @MainActor
    func updateViewState() {
        state = movies?.isEmpty ?? false ? .empty : .idle
        reloadTableView.send()
    }

    /// Handles error cases by updating the view state to indicate an error on the `Main Thread`.
    /// - Parameter error: The error that occurred.
    @MainActor
    func onReceiveError(_ error: Error) {
        self.state = .error(error)
    }
}
// MARK: - Constants
private extension MoviesListViewModel {
    /// Constants used in the MoviesListViewModel.
    enum Constants {
        static let screenTitle = "Trending Movies"
    }
}
