//
//  FetchMovieDetailsRequest.swift
//
//
//  Created by Ahmed Ali on 02/02/2024.
//
import Networking

/// Represents a request to fetch detailed information about a movie.
struct FetchMovieDetailsRequest: RequestType {

    /// The response type expected from the API.
    typealias ResponseType = MovieDetailsDTO

    /// The unique identifier of the movie for which details are requested.
    private let id: Int

    /// Initializes a new `FetchMovieDetailsRequest` with the specified movie identifier.
    ///
    /// - Parameter id: The unique identifier of the movie.
    init(id: Int) {
        self.id = id
    }

    /// The relative path for the request, indicating the specific movie details.
    var path: String {
        "/movie/\(id)"
    }

    /// The HTTP method for the request.
    var method: Networking.RequestMethod {
        .get
    }

    /// The query parameters for the request, including the API key.
    var queryParameters: [String: String] {
        ["api_key": Environment.apiKey]
    }
}
