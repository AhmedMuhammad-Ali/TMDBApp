//
//  MoviesListContract.swift
//  TMDBApp
//
//  Created by Ahmed Ali on 31/01/2024.
//

import Domain
import Combine

/// An array type representing a collection of `movies` instances.
typealias Movies = [MovieTableViewCell.ViewModel]
typealias MoviesListViewModelType = ViewModelProtocol & MoviesListViewModelInput & MoviesListViewModelOutput

/// A protocol defining the input methods for a Movies List ViewModel.
protocol MoviesListViewModelInput {

    /// Notifies the ViewModel when a movie is tapped at a specific index.
    /// - Parameter index: The index of the tapped user.
    func didTappedOnMovie(at index: Int)
    func fetchAllMovies()
}

/// A protocol defining the output properties and methods for a movies List ViewModel.
protocol MoviesListViewModelOutput {

    /// A subject for triggering a table view reload.
    var reloadTableView: PassthroughSubject<Void, Never> { get }

    /// The count of movies in the view model.
    var moviesCount: Int { get }

    /// The title of the screen or view.
    var screenTitle: String { get }

    /// Accesses the `Movie` at a specific index in the list.
    subscript(index: Int) -> MovieTableViewCell.ViewModel? { get }
}
