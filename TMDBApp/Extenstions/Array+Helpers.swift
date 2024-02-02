//
//  Array+Helper.swift
//  TMDBApp
//
//  Created by Ahmed Ali on 28/01/2024.
//
extension Array {
    /// Safely retrieves an element at the specified index if it is within the array's bounds.
    ///
    /// - Parameter safe: The index to access safely.
    /// - Returns: The element at the specified index if it exists, or `nil` if the index is out of bounds.
    public subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
