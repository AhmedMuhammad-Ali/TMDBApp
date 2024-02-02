//
//  DefaultFetchMovieDetailsUseCase.swift
//
//
//  Created by Ahmed Ali on 02/02/2024.
//

import Foundation
/// A concrete implementation of the `FetchMovieDetailsUseCase` protocol responsible for executing the use case of fetching detailed information about a movie.
public final class DefaultFetchMovieDetailsUseCase: FetchMovieDetailsUseCase {

    /// The repository responsible for fetching movie details information.
    public var movieDetailsRepository: MovieDetailsRepository

    /// Initializes an instance of `DefaultFetchMovieDetailsUseCase` with the specified movie details repository.
    ///
    /// - Parameter movieDetailsRepository: The repository responsible for fetching movie details information.
    public init(_ movieDetailsRepository: MovieDetailsRepository) {
        self.movieDetailsRepository = movieDetailsRepository
    }

    /// Executes the use case, fetching detailed information for a movie with the specified identifier.
    ///
    /// - Parameter id: The unique identifier of the movie.
    ///
    /// - Returns: An instance of `MovieDetails` representing the detailed information of the specified movie.
    ///
    /// - Throws: An error of type `Error` if movie details cannot be retrieved.
    public func execute(by id: Int) async throws -> MovieDetails {
        return try await movieDetailsRepository.fetchMovie(by: id)
    }
}
