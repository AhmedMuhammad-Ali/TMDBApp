//
//  DefaultFetchAllMoviesUseCase.swift
//
//
//  Created by Ahmed Ali on 30/01/2024.
//

/// A concrete implementation of the `FetchAllMoviesUseCase` protocol that fetches information for all movies.
public final class DefaultFetchAllMoviesUseCase: FetchAllMoviesUseCase {
    /// The repository responsible for fetching Movie information.
    public let moviesRepository: MoviesRepository

    /// Initializes an instance of `DefaultFetchAllMoviesUseCase`.
    ///
    /// - Parameter moviesRepository: A repository responsible for fetching movie information.
    public init(_ moviesRepository: MoviesRepository) {
        self.moviesRepository = moviesRepository
    }

    /// Executes the use case, fetching information for all movies.
    ///
    /// - Returns: A MoviesPage instance representing a page of movies.
    ///
    /// - Throws: An error of type `Error` if movie information cannot be retrieved.
    public func execute() async throws -> MoviesPage {
        try await moviesRepository.fetchAllMovies()
    }
}
