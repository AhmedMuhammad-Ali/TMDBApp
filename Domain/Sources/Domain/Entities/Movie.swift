//
//  Movie.swift
//
//
//  Created by Ahmed Ali on 30/01/2024.
//
/// A data structure representing a Movie.
public struct Movie: Codable {
    /// The unique identifier for the movie.
    public let id: Int

    /// The original title of the movie.
    public let originalTitle: String

    /// An overview or summary of the movie.
    public let overview: String

    /// The file path for the movie's poster image.
    public let posterPath: String

    /// The release date of the movie.
    public let releaseDate: String

    /// The title of the movie.
    public let title: String

    /// Coding keys used to map between Swift property names and JSON keys during encoding and decoding.
    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
    }
}
