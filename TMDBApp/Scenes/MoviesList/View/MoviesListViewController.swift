//
//  MoviesListViewController.swift
//  TMDBApp
//
//  Created by Ahmed Ali on 31/01/2024.
//

import UIKit
import Combine
/// Custom view controller for displaying a list of movies.
final class MoviesListViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    // MARK: - Properties
    /// Loading indicator for indicating data loading.
    @NoAutoresizingMask
    var loadingIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        return activityIndicator
    }()
    /// Set of cancellables to manage Combine subscriptions.
    var cancellable: Set<AnyCancellable> = []
    /// The view model responsible for managing the movie list.
    private var viewModel: MoviesListViewModelType

    // MARK: - Initializers
    /**
     Initializes the view controller with a movie list view model.
     
     - Parameter viewModel: The movie list view model.
     */
    init(viewModel: MoviesListViewModel) {
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
        configureTableView()
        configureBinding()
        viewModel.fetchAllMovies()
    }
}

// MARK: - Appearance Configuration
private extension MoviesListViewController {
    /// Configures the appearance of the view controller.
    func configureUI() {
        setupConstraints()
        configureNavigationTitle()
    }

    /// Sets up Auto Layout constraints for the loading indicator.
    func setupConstraints() {
        view.addSubview(loadingIndicator)
        loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    /// Sets the navigation title of the view controller.
    func configureNavigationTitle() {
        self.title = viewModel.screenTitle
    }
}

// MARK: - Configuration
private extension MoviesListViewController {
    /// Configures the table view's delegate, data source, and prefetch data source.
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.prefetchDataSource = self
        tableView.registerNib(cell: MovieTableViewCell.self)
    }
    /// Configures data binding for the view model's state and table view reloading.
    func configureBinding() {
        configureStateBinding(state: viewModel.statePublisher)

        viewModel.reloadTableView
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                self?.tableView.reloadData()
            }
            .store(in: &cancellable)
    }
}

// MARK: - UITableViewDelegate
extension MoviesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.didTappedOnMovie(at: indexPath.row)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.rowHeight
    }
}

// MARK: - UITableViewDataSource
extension MoviesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.moviesCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        guard let cellViewModel = viewModel[indexPath.row] else { return UITableViewCell() }
        cell.configure(with: cellViewModel)
        return cell
    }
}

// MARK: - UITableViewDataSourcePrefetching
extension MoviesListViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for index in indexPaths where index.row >= viewModel.moviesCount - Constants.prefetchThreshold {
            viewModel.fetchAllMovies()
            break
        }
    }
}

// MARK: - LoadingStateControllable & EmptyViewStateControllable
extension MoviesListViewController: LoadingStateControllable {
    var emptyModel: EmptyViewModel {
        EmptyViewModel(title: Constants.emptyViewTitle, description: Constants.emptyViewDescription)
    }
}

// MARK: - Constants
private extension MoviesListViewController {
    /// Constants related to the movie list view controller.
    enum Constants {
        /// The number of rows before the end to trigger prefetching.
        static let prefetchThreshold = 3
        /// The height of each row in the table view.
        static let rowHeight: CGFloat = 202.0
        /// Title for the empty view when no movies are found.
        static let emptyViewTitle = "No Movies Found"
        /// Description for the empty view when no movies are found.
        static let emptyViewDescription = "There are currently no movies available. Please check back later."
    }
}
