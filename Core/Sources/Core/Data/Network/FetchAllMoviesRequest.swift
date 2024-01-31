//
//  FetchAllMoviesRequest.swift
//
//
//  Created by Ahmed Ali on 30/01/2024.
//

import Networking

/// A request for fetching all movies.
struct FetchAllMoviesRequest: RequestType {

    /// The type of response expected from the request.
    typealias ResponseType = MoviesResponseDTO

    /// The path for the request, indicating all movies.
    var path: String {
        "/discover/movie"
    }

    /// The HTTP method for the request.
    var method: Networking.RequestMethod {
        .get
    }
}
