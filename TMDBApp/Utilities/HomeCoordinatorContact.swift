//
//  HomeCoordinatorContact.swift
//  TMDBApp
//
//  Created by Ahmed Ali on 02/02/2024.
//

import UIKit
import Domain

/// A coordinator responsible for managing the navigation flow within the home module.
protocol HomeCoordinatorContact: AnyObject {
    /// Shows the movies list screen.
    func showMoviesList()

    /// Shows the details screen for a specific movie.
    ///
    /// - Parameter movieID: The unique identifier of the movie.
    func showMovieDetails(with movieID: Int)
}

/// A concrete implementation of the `HomeCoordinator` protocol.
final class DefaultHomeCoordinator: Coordinator {
    let navigationController: UINavigationController

    /// Initializes an instance of `DefaultHomeCoordinator`.
    ///
    /// - Parameter navigationController: The navigation controller to use for managing the view hierarchy.
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    /// Starts the home coordinator and shows the list of movies by default.
    func start() {
        showMoviesList()
    }
}
// MARK: - DefaultHomeCoordinator + HomeCoordinator
extension DefaultHomeCoordinator: HomeCoordinatorContact {
    /// Shows a list of movies by instantiating and presenting a `MoviesListViewController`.
    func showMoviesList() {
        let viewModel = DIContainer.shared.resolve(type: MoviesListViewModel.self)
        let viewController = MoviesListViewController(viewModel: viewModel)
        navigationController.setViewControllers([viewController], animated: false)
    }
    /// Shows the details screen for a specific movie by printing the movie ID.
    ///
    /// - Parameter movieID: The unique identifier of the movie.
    func showMovieDetails(with movieID: Int) {
        print(movieID)
    }

}
