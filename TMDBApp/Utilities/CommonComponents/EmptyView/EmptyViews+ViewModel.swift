//
//  EmptyViews+ViewModel.swift
//  TMDBApp
//
//  Created by Ahmed Ali on 31/01/2024.
//

import UIKit
// MARK: - EmptyView + View Model
extension EmptyView {
    /// The view model for configuring the `EmptyView`.
    struct ViewModel {
        let title: String
        let description: String?
        let image: UIImage

        init(title: String, description: String?, image: UIImage = UIImage(named: "emptyViewPic") ?? UIImage()) {
            self.title = title
            self.description = description
            self.image = image
        }
    }
}
