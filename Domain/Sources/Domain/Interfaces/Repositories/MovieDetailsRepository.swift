//
//  MovieDetailsRepository.swift
//
//
//  Created by Ahmed Ali on 02/02/2024.
//
import Foundation
/// A protocol defining methods for fetching detailed information about movies.
public protocol MovieDetailsRepository {
    /// Fetches detailed information for a movie with the specified identifier.
    ///
    /// - Parameter id: The unique identifier of the movie.
    ///
    /// - Returns: An instance of `MovieDetails` representing the detailed information of the specified movie.
    ///
    /// - Throws: An error of type `Error` if movie details cannot be retrieved.
    func fetchMovie(by id: Int) async throws -> MovieDetails
}
