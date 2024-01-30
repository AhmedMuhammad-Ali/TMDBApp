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
    
    public init?(id: Int?,
                 overview: String?,
                 posterPath: String?,
                 releaseDate: Date?,
                 title: String?) {
        guard let id = id,
              let overview = overview,
              let posterPath = posterPath,
              let releaseDate = releaseDate,
              let title = title else { return nil }

        self.id = id
        self.overview = overview
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.title = title
    }
}

public struct MoviesPage {
    let page: Int
    let totalPages: Int
    let movies: [Movie]
    
    public init?(page: Int?, totalPages: Int?, movies: [Movie]?) {
        guard let page = page, let totalPages = totalPages, let movies = movies else { return nil}
        self.page = page
        self.totalPages = totalPages
        self.movies = movies
    }
}
