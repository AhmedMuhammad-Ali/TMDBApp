//
//  MoviesRepository.swift
//
//
//  Created by Ahmed Ali on 30/01/2024.
//

import Foundation
/// A protocol defining the contract for fetching movie information.
public protocol MoviesRepository {
    /// Fetches information for all movies on a specified page.
    ///
    /// - Parameter page: The page number for which movie information is requested.
    ///
    /// - Returns: An instance of `MoviesPage` representing a page of movies.
    ///
    /// - Throws: An error of type `Error` if movie information cannot be retrieved.
    func fetchAllMovies(for page: Int) async throws -> MoviesPage
}
