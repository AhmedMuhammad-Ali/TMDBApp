//
//  Movie.swift
//
//
//  Created by Ahmed Ali on 30/01/2024.
//
import Foundation

/// A data structure representing a Movie.
public struct Movie {

    /// The unique identifier for the movie.
    public let id: Int

    /// An overview or summary of the movie.
    public let overview: String

    /// The file path for the movie's poster image.
    public let posterPath: String

    /// The release date of the movie.
    public let releaseDate: Date

    /// The title of the movie.
    public let title: String

    /// Initializes a Movie instance with optional parameters, returning nil if any required parameter is missing.
    ///
    /// - Parameters:
    ///   - id: The unique identifier for the movie.
    ///   - overview: An overview or summary of the movie.
    ///   - posterPath: The file path for the movie's poster image.
    ///   - releaseDate: The release date of the movie.
    ///   - title: The title of the movie.
    ///
    /// - Returns: An initialized Movie instance or nil if any required parameter is missing.
    public init?(id: Int?, overview: String?, posterPath: String?, releaseDate: Date?, title: String?) {
        guard let id = id, let overview = overview, let posterPath = posterPath, let releaseDate = releaseDate, let title = title else {
            return nil
        }

        self.id = id
        self.overview = overview
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.title = title
    }
}

/// A data structure representing a page of movies.
public struct MoviesPage {

    /// The page number.
    public let page: Int

    /// The total number of pages.
    public let totalPages: Int

    /// An array of Movie instances representing the movies on this page.
    public let movies: [Movie]

    /// Initializes a MoviesPage instance with optional parameters, returning nil if any required parameter is missing.
    ///
    /// - Parameters:
    ///   - page: The page number.
    ///   - totalPages: The total number of pages.
    ///   - movies: An array of Movie instances representing the movies on this page.
    ///
    /// - Returns: An initialized MoviesPage instance or nil if any required parameter is missing.
    public init?(page: Int?, totalPages: Int?, movies: [Movie]?) {
        guard let page = page, let totalPages = totalPages, let movies = movies else {
            return nil
        }
        self.page = page
        self.totalPages = totalPages
        self.movies = movies
    }
}
