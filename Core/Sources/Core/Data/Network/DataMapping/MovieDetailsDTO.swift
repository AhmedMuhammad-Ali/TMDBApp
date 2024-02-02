//
//  MovieDetailsResponse+Mapping.swift
//
//
//  Created by Ahmed Ali on 02/02/2024.
//

import Foundation
import Domain

/// Represents the data transfer object (DTO) for movie details.
struct MovieDetailsDTO: Decodable {

    /// The title of the movie.
    let title: String?

    /// The file path for the movie's poster image.
    let posterPath: String?

    /// An overview or summary of the movie.
    let overview: String?

    /// The release date of the movie.
    let releaseDate: String?

    /// The production companies involved in the movie.
    let productionCompanies: [ProductionCompany]?

    /// The production countries associated with the movie.
    let productionCountries: [ProductionCountry]?

    private enum CodingKeys: String, CodingKey {
        case title
        case posterPath = "poster_path"
        case overview
        case releaseDate = "release_date"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
    }
}

// MARK: - Mappings to Domain
extension MovieDetailsDTO {
    /// Converts the MovieDetailsDTO to a corresponding MovieDetails domain object.
    func toDomain() -> MovieDetails? {
        guard let productionCompanies = productionCompanies, let productionCountries = productionCountries else { return nil }

        return .init(
            title: title,
            overview: overview,
            posterPath: posterPath,
            releaseDate: dateFormatter.date(from: releaseDate ?? ""),
            productionCompanies: productionCompanies.map { $0.name },
            productionCountries: productionCountries.map { $0.name }
        )
    }
}

// MARK: - Private
/// A date formatter for converting date strings to Date objects.
private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter
}()

// MARK: - ProductionCompany
/// Represents a production company associated with a movie.
struct ProductionCompany: Codable {
    let name: String
}

// MARK: - ProductionCountry
/// Represents a production country associated with a movie.
struct ProductionCountry: Codable {
    let name: String
}
