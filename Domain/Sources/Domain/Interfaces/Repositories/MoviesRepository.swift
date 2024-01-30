//
//  MoviesRepository.swift
//
//
//  Created by Ahmed Ali on 30/01/2024.
//

import Foundation
/// A protocol defining the requirements for fetching movie information.
public protocol MoviesRepository {
    /// Fetches information for all users.
    ///
    /// - Returns: An array of `Movie` instances representing movie information.
    ///
    /// - Throws: An error of type `Error` if the movie information cannot be retrieved.
    func fetchAllMovies() async throws -> [MoviesPage]
}
