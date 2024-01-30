//
//  DefaultMoviesRepository.swift
//
//
//  Created by Ahmed Ali on 30/01/2024.
//
import Domain
import Networking

/// A concrete implementation of the `MoviesRepository` protocol for fetching movie information.
public final class DefaultMoviesRepository {
    private let networking: NetworkDispatcher
    /// Initializes an instance of `DefaultMoviesRepository`.
    ///
    /// - Parameter networking: An optional `NetworkDispatcher` to use for network requests. Defaults to `DefaultNetworkDispatcher`.
    public init(networking: NetworkDispatcher = DefaultNetworkDispatcher()) {
        self.networking = networking
    }
}
// MARK: - DefaultMoviesRepository + MoviesRepository
extension DefaultMoviesRepository: MoviesRepository {
    /// Fetches information for all movies.
    ///
    /// - Returns: An array of `Movie` instances representing movie information.
    ///
    /// - Throws: An error of type `Error` if movie information cannot be retrieved.
    public func fetchAllMovies() async throws -> [MoviesPage] {
        let result = await networking.dispatch(FetchAllMoviesRequest())
        switch result {
        case .success(let responseDTO):
            return responseDTO.compactMap({ $0.toDomain()})
        case .failure(let error):
            throw error
        }
    }
}
