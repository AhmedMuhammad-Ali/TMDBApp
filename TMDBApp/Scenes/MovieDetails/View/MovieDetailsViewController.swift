//
//  MovieDetailsViewController.swift
//  TMDBApp
//
//  Created by Ahmed Ali on 02/02/2024.
//

import UIKit
import Combine

/// View controller to display movie details.
class MovieDetailsViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var overviewLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var productionCompaniesLabel: UILabel!
    @IBOutlet private weak var productionCountriesLabel: UILabel!

    // MARK: - Properties
    private var viewModel: MoviesDetailsViewModelType
    /// Set of cancellables to manage Combine subscriptions.
    var cancellable: Set<AnyCancellable> = []
    /// Loading indicator for indicating data loading.
    @NoAutoresizingMask
    var loadingIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        return activityIndicator
    }()

    // MARK: - Initializers
    /**
     Initializes the view controller with a movie details view model.
     
     - Parameter viewModel: The movie details view model.
     */
    init(viewModel: MoviesDetailsViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureBinding()
        viewModel.fetchMovieDetails()
    }
}
// MARK: - Appearance Configuration
private extension MovieDetailsViewController {
    /// Configures the appearance and data presentation of the view controller.
    func configureUI() {
        setupConstraints()
        setupNavigationBar()
    }
    /// Sets up Auto Layout constraints for the loading indicator.
    func setupConstraints() {
        view.addSubview(loadingIndicator)
        loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    /// Configures the navigation bar title based on the screen title provided by the view model.
    func setupNavigationBar() {
        self.title = viewModel.screenTitle
    }
}
// MARK: - Configure Binding
private extension MovieDetailsViewController {
    /// Configures the display of movie details by setting the image, title, overview, release date,
    /// production companies, and production countries labels based on the data provided by the view model.
    func configureData() {
        movieImageView.setImage(urlString: viewModel.moviePosterPath, placeholder: .placeholderImage)
        titleLabel.text = viewModel.movieTitle
        overviewLabel.text = viewModel.movieOverview
        releaseDateLabel.text = viewModel.movieReleaseDate
        productionCompaniesLabel.text = viewModel.movieProductionCompanies
        productionCountriesLabel.text = viewModel.movieProductionCountries
    }
    // MARK: - Binding Configuration
    /// Configures data binding for the view model's state and updates the view when data reloads.
    func configureBinding() {
        configureStateBinding(state: viewModel.statePublisher)

        viewModel.reloadView
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                self?.configureData()
            }
            .store(in: &cancellable)
    }
}

// MARK: - LoadingStateControllable & EmptyViewStateControllable
extension MovieDetailsViewController: LoadingStateControllable {
    var emptyModel: EmptyViewModel {
        EmptyViewModel(title: Constants.emptyViewTitle, description: Constants.emptyViewDescription)
    }
}

// MARK: - Constants
private extension MovieDetailsViewController {
    /// Constants related to the movie details view controller.
    enum Constants {
        /// Title for the empty view when no movie details are found.
        static let emptyViewTitle = "No Movie Details Found"
        /// Description for the empty view when no movie details is found.
        static let emptyViewDescription = "There are currently no movie details available. Please check back later."
    }
}
