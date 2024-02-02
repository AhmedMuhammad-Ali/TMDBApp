//
//  AppCoordinator.swift
//  TMDBApp
//
//  Created by Ahmed Ali on 02/02/2024.
//

import UIKit
import Domain
import Core

/// A coordinator responsible for managing the app's navigation flows.
final class AppCoordinator: Coordinator {

    private let window: UIWindow
    private var children: [Coordinator] = []
    var navigationController: UINavigationController

    /// Initializes an instance of `AppCoordinator`.
    ///
    /// - Parameters:
    ///   - window: The main application window.
    ///   - navigationController: The root navigation controller for the app.
    init(window: UIWindow, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.window = window
    }

    /// Starts the app coordinator by configuring dependencies and displaying the home flow.
    func start() {
        configureDependencies()
        displayHomeFlow()
    }
}

// MARK: Flows Helpers
private extension AppCoordinator {

    /// Displays the home flow by initializing and starting the `DefaultHomeCoordinator`.
    func displayHomeFlow() {
        let coordinator = DIContainer.shared.resolve(type: DefaultHomeCoordinator.self, objectScope: .singleton)
        coordinator.start()
        children.append(coordinator)
        replaceRootViewController(navigationController)
    }
}

// MARK: Window Replacement
private extension AppCoordinator {

    /// Replaces the root view controller of the app's window.
    ///
    /// This method sets the specified view controller as the root view controller of the app's window,
    /// and makes the window visible.
    ///
    /// - Parameter viewController: The view controller to set as the root view controller.
    func replaceRootViewController(_ viewController: UIViewController) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}

private extension AppCoordinator {

    /// Configures all necessary dependencies for the app.
    func configureDependencies() {
        configureMoviesDependencies()
    }

    func configureMoviesDependencies() {
        configureReposDependencies()
        configureUseCasesDependencies()
        configureCoordinatorDependencies()
        configureViewModelDependencies()
    }
    func configureCoordinatorDependencies() {
        DIContainer.shared.register(type: DefaultHomeCoordinator.self, objectScope: .singleton) { [unowned self] in
            return DefaultHomeCoordinator(navigationController: self.navigationController)
        }
    }
    func configureReposDependencies() {
        DIContainer.shared.register(type: MoviesRepository.self) {
            return DefaultMoviesRepository()
        }
    }

    func configureUseCasesDependencies() {
        DIContainer.shared.register(type: FetchAllMoviesUseCase.self) {
            return DefaultFetchAllMoviesUseCase(DIContainer.shared.resolve(type: MoviesRepository.self))
        }
    }

    func configureViewModelDependencies() {
        DIContainer.shared.register(type: MoviesListViewModel.self) {
            let coordinator = DIContainer.shared.resolve(type: DefaultHomeCoordinator.self, objectScope: .singleton)
            let fetchAllMoviesUseCase = DIContainer.shared.resolve(type: FetchAllMoviesUseCase.self)

            return MoviesListViewModel(coordinator: coordinator, useCase: fetchAllMoviesUseCase)
        }
    }
}
