//
//  FetchAllMoviesRequest.swift
//
//
//  Created by Ahmed Ali on 30/01/2024.
//

import Networking

/// A request for fetching all movies from the server.
struct FetchAllMoviesRequest: RequestType {

    /// The type of response expected from the request.
    typealias ResponseType = MoviesResponseDTO

    /// The page number of the movies to be fetched.
    private let page: Int

    /// Initializes a new instance of `FetchAllMoviesRequest`.
    /// - Parameter page: The page number for paginated movie results.
    init(page: Int) {
        self.page = page
    }

    /// The relative path for the request, indicating all movies.
    var path: String {
        "/discover/movie"
    }

    /// The HTTP method for the request.
    var method: Networking.RequestMethod {
        .get
    }

    /// The query parameters for the request, including the API key and page number.
    var queryParameters: [String: String] {
        ["api_key": Environment.apiKey,
         "page": "\(page)"]
    }
}
