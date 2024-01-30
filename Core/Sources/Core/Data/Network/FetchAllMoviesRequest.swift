//
//  FetchAllMoviesRequest.swift
//
//
//  Created by Ahmed Ali on 30/01/2024.
//

import Networking

/// A request for fetching all movies.
struct FetchAllMoviesRequest: RequestType {
    typealias ResponseType = [MoviesResponseDTO]

    /// The path for the request, indicating all users.
    var path: String {
        "/discover/movie"
    }

    /// The HTTP method for the request.
    var method: Networking.RequestMethod {
        .get
    }
}
