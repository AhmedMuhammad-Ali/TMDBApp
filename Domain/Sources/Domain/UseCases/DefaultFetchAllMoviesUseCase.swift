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

    /// Executes the use case to fetch information for all movies.
    ///
    /// - Returns: An array of `Movie` instances representing movie information.
    ///
    /// - Throws: An error of type `Error` if movie information cannot be retrieved.
    public func execute() async throws -> [Movie] {
        try await moviesRepository.fetchAllMovies()
    }
}
