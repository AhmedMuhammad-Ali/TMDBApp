//
//  MovieDetailsContract.swift
//  TMDBApp
//
//  Created by Ahmed Ali on 02/02/2024.
//

import Domain
import Combine

typealias MoviesDetailsViewModelType = ViewModelProtocol & MovieDetailsViewModelInput & MovieDetailsViewModelOutput

protocol MovieDetailsViewModelInput {

    func fetchMovieDetails()
}

protocol MovieDetailsViewModelOutput {
    var movieTitle: String? { get }
    var moviePosterPath: String? { get }
    var movieOverview: String? { get }
    var movieReleaseDate: String? { get }
    var movieProductionCompanies: String? {  get  }
    var movieProductionCountries: String? { get }

    var screenTitle: String { get }
    var reloadView: PassthroughSubject<Void, Never> { get }

}
