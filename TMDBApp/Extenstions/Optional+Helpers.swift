//
//  Optional+Helpers.swift
//  TMDBApp
//
//  Created by Ahmed Ali on 28/01/2024.
//

extension Optional where Wrapped == String {
    /// Gets the wrapped string value or an empty string if the optional is nil.
    var value: String {
        return self ?? .empty
    }
}
