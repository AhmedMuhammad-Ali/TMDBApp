//
//  NoAutoresizingMask.swift
//  TMDBApp
//
//  Created by Ahmed Ali on 01/02/2024.
//

import UIKit

/// A property wrapper that ensures a `UIView` does not use autoresizing masks.
@propertyWrapper
struct NoAutoresizingMask<T> where T: UIView {
    private var value: T

    /// The wrapped value of the property wrapper.
    var wrappedValue: T {
        get { return value }
        set { value = newValue }
    }

    /// Initializes the property wrapper with a wrapped value and sets `translatesAutoresizingMaskIntoConstraints` to `false`.
    ///
    /// - Parameter wrappedValue: The wrapped value of the property wrapper.
    init(wrappedValue: T) {
        self.value = wrappedValue
        value.translatesAutoresizingMaskIntoConstraints = false
    }
}
