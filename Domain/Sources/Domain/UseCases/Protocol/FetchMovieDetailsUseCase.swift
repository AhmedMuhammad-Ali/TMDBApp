//
//  FetchMovieDetailsUseCase.swift
//  
//
//  Created by Ahmed Ali on 02/02/2024.
//

import Foundation
/// A protocol defining the contract for the use case of fetching detailed information about a movie.
public protocol FetchMovieDetailsUseCase {

    /// Executes the use case, fetching detailed information for a movie with the specified identifier.
    ///
    /// - Parameter id: The unique identifier of the movie.
    ///
    /// - Returns: An instance of `MovieDetails` representing the detailed information of the specified movie.
    ///
    /// - Throws: An error of type `Error` if movie details cannot be retrieved.
    func execute(by id: Int) async throws -> MovieDetails

    /// The repository responsible for fetching movie details information.
    var movieDetailsRepository: MovieDetailsRepository { get }
}
