//
//  MovieDetails.swift
//  
//
//  Created by Ahmed Ali on 02/02/2024.
//

import Foundation

/// A data structure representing a Movie Details.
public struct MovieDetails {
    /// The title of the movie.
    public let title: String

    /// An overview or summary of the movie.
    public let overview: String

    /// The file path for the movie's poster image.
    public let posterPath: String

    /// The release date of the movie.
    public let releaseDate: Date

    /// The production companies involved in the movie.
    public let productionCompanies: [String]

    /// The production countries associated with the movie.
    public let productionCountries: [String]

    /// Represents a movie object with details such as title, overview, poster path, release date, production companies, and production countries.
    ///
    /// - Parameters:
    ///   - title: The title of the movie.
    ///   - overview: An overview or summary of the movie.
    ///   - posterPath: The file path for the movie's poster image.
    ///   - releaseDate: The release date of the movie.
    ///   - productionCompanies: The production companies involved in the movie.
    ///   - productionCountries: The production countries associated with the movie.
    ///
    /// - Returns: An initialized `Movie` object if all required properties have non-nil values; otherwise, returns nil.
    public init?(title: String?, overview: String?, posterPath: String?, releaseDate: Date?, productionCompanies: [String]?, productionCountries: [String]?) {
        // Use guard statements to check for nil values
        guard let title = title,
              let overview = overview,
              let posterPath = posterPath,
              let releaseDate = releaseDate,
              let productionCompanies = productionCompanies,
              let productionCountries = productionCountries else { return nil }

        // Initialize the object with non-nil values
        self.title = title
        self.overview = overview
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.productionCompanies = productionCompanies
        self.productionCountries = productionCountries
    }
}
