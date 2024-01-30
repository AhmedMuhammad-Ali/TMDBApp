//
//  FetchAllMoviesUseCase.swift
//
//
//  Created by Ahmed Ali on 30/01/2024.
//

import Foundation
/// A protocol defining the requirements for a use case to fetch all movies.
public protocol FetchAllMoviesUseCase {
    /// Executes the use case to fetch all movies.
    ///
    /// - Returns: An array of `Movie` instances representing movie information.
    ///
    /// - Throws: An error of type `Error` if movie information cannot be retrieved.
    func execute() async throws -> [Movie]

    /// A repository responsible for fetching movie information.
    var moviesRepository: MoviesRepository { get }
}
