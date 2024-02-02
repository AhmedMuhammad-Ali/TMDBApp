//
//  DefaultMovieDetailsRepository.swift
//
//
//  Created by Ahmed Ali on 02/02/2024.
//

import Domain
import Networking

/// A concrete implementation of the `MovieDetailsRepository` protocol responsible for fetching detailed information about a movie.
public final class DefaultMovieDetailsRepository {

    /// The network dispatcher responsible for handling network requests.
    private let networking: NetworkDispatcher

    /// Initializes an instance of `DefaultMovieDetailsRepository`.
    ///
    /// - Parameter networking: The network dispatcher for handling network requests. Defaults to `DefaultNetworkDispatcher`.
    public init(networking: NetworkDispatcher = DefaultNetworkDispatcher()) {
        self.networking = networking
    }
}

// MARK: - DefaultMovieDetailsRepository + MovieDetailsRepository
extension DefaultMovieDetailsRepository: MovieDetailsRepository {
    /// Fetches detailed information for a movie with the specified identifier.
    ///
    /// - Parameter id: The unique identifier of the movie.
    ///
    /// - Returns: An instance of `MovieDetails` representing the detailed information of the specified movie.
    ///
    /// - Throws: An error of type `Error` if movie details cannot be retrieved.
    public func fetchMovie(by id: Int) async throws -> MovieDetails {
        let result = await networking.dispatch(FetchMovieDetailsRequest(id: id))
        switch result {
        case .success(let responseDTO):
            guard let movieDetails = responseDTO.toDomain() else { throw RequestError.noResponse }
            return movieDetails
        case .failure(let error):
            throw error
        }
    }
}
