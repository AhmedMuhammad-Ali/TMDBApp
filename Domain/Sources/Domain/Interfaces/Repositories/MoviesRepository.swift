//
//  MoviesRepository.swift
//
//
//  Created by Ahmed Ali on 30/01/2024.
//

import Foundation
/// A protocol defining the contract for fetching movie information.
public protocol MoviesRepository {
    /// Fetches information for all movies.
    ///
    /// - Returns: A MoviesPage instance representing a page of movies.
    ///
    /// - Throws: An error of type `Error` if movie information cannot be retrieved.
    func fetchAllMovies() async throws -> MoviesPage
}
