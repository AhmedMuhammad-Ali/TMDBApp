//
//  MovieTableViewCell.swift
//  TMDBApp
//
//  Created by Ahmed Ali on 31/01/2024.
//

import UIKit
import Domain
import Kingfisher

/// Custom table view cell for displaying movie information.
class MovieTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var movieTitleLabel: UILabel!
    @IBOutlet private weak var movieReleasedDateLabel: UILabel!
}
// MARK: - Configuration
extension MovieTableViewCell {
    /// Configures the cell with the provided view model.
    ///
    /// - Parameter viewModel: The view model containing movie information.
    func configure(with viewModel: ViewModel) {
        movieTitleLabel.text = viewModel.title
        movieReleasedDateLabel.text = viewModel.releaseDate
        movieImageView.setImage(representable: viewModel)
    }
}

// MARK: - ViewModel
extension MovieTableViewCell {
    /// View model representing movie information for the cell.
    struct ViewModel: ImageRepresentable {
        /// The placeholder image to be used when the movie poster is not available.
        var placeholderImage: UIImage? {
            .placeholderImage
        }

        /// The title of the movie.
        let title: String
        /// Overview or description of the movie.
        let overview: String
        /// The release date of the movie.
        let releaseDate: String
        /// The file path for the movie's poster image.
        var imageURL: String?

        /// Initializes the view model with movie data.
        ///
        /// - Parameter movie: The movie object containing raw data.
        init(movie: Movie) {
            self.title = movie.title
            self.imageURL = movie.posterPath
            self.overview = movie.overview
            self.releaseDate = dateFormatter.string(from: movie.releaseDate)
        }
    }
}

/// Date formatter for converting date objects to string representation.
private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy"
    return formatter
}()
