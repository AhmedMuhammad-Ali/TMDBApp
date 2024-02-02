//
//  UIImageView+LoadImage.swift
//  TMDBApp
//
//  Created by Ahmed Ali on 01/02/2024.
//

import UIKit
import Kingfisher
import Networking
// MARK: - ImageRepresentable
//
protocol ImageRepresentable {
    var imageURL: String? { get }
    var placeholderImage: UIImage? { get }
}

// MARK: - ImageLoader
//
protocol ImageLoader {

    /// Set image using url as string and placeholder image in case of failure to fetch the image
    func setImage(urlString: String?, placeholder: UIImage?)

    /// Set image using `ImageRepresentable` item
    func setImage(representable: ImageRepresentable?)
}

// MARK: - UIImageView + ImageLoader Conformance
//
extension UIImageView: ImageLoader {

    func setImage(urlString: String?, placeholder: UIImage?) {
        let url = URL(string: Environment.baseImagePath + (urlString ?? .empty))
        self.kf.setImage(with: url, placeholder: placeholder)
    }

    func setImage(representable: ImageRepresentable?) {
        setImage(urlString: representable?.imageURL,
                 placeholder: representable?.placeholderImage)
    }
}
