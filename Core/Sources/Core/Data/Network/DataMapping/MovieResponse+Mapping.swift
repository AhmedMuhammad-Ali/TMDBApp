//
//  MovieResponse+Mapping.swift
//
//
//  Created by Ahmed Ali on 30/01/2024.
//

import Foundation
import Domain
/// A data transfer object representing the response for a list of movies.
struct MoviesResponseDTO: Decodable {

    /// The page number of the movie list.
    let page: Int?

    /// The total number of pages in the movie list.
    let totalPages: Int?

    /// An array of movie data transfer objects.
    let movies: [MovieDTO]?

    private enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case movies = "results"
    }
}
/// A data transfer object representing a movie.
struct MovieDTO: Decodable {

    /// The unique identifier for the movie.
    let id: Int

    /// The title of the movie.
    let title: String?

    /// The file path for the movie's poster image.
    let posterPath: String?

    /// An overview or summary of the movie.
    let overview: String?

    /// The release date of the movie.
    let releaseDate: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath = "poster_path"
        case overview
        case releaseDate = "release_date"
    }
}

// MARK: - Mappings to Domain
extension MoviesResponseDTO {
    /// Converts the DTO to the corresponding domain model.
    func toDomain() -> MoviesPage? {
        return .init(page: page,
                     totalPages: totalPages,
                     movies: movies?.compactMap { $0.toDomain() })
    }
}

extension MovieDTO {
    /// Converts the DTO to the corresponding domain model.
    func toDomain() -> Movie? {
        return .init(id: id,
                     overview: overview,
                     posterPath: posterPath,
                     releaseDate: dateFormatter.date(from: releaseDate ?? ""),
                     title: title)
    }
}

// MARK: - Private

/// A date formatter for converting date strings to Date objects.
private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter
}()
