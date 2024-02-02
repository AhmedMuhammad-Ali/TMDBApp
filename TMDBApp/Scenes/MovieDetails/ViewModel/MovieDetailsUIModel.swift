//
//  MovieDetailsUIModel.swift
//  TMDBApp
//
//  Created by Ahmed Ali on 02/02/2024.
//

import UIKit
import Domain

struct MovieDetailsUIModel: ImageRepresentable {
    var imageURL: String?
    let title: String
    let overview: String
    let releaseDate: String
    let productionCompanies: String
    let productionCountries: String
}
extension MovieDetailsUIModel {
    init(from movieDetails: MovieDetails) {
        self.init(
            imageURL: movieDetails.posterPath,
            title: movieDetails.title,
            overview: movieDetails.overview,
            releaseDate: formattedDate(date: movieDetails.releaseDate),
            productionCompanies: movieDetails.productionCompanies.joined(separator: ", "),
            productionCountries: movieDetails.productionCountries.joined(separator: ", ")
        )
    }
}
private func formattedDate(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM dd, yyyy"
    return formatter.string(from: date)
}
