//
//  PagingManager.swift
//  TMDBApp
//
//  Created by Ahmed Ali on 31/01/2024.
//

import Foundation
/// Manages pagination for a data loading operation.
final class PagingManager {
    // MARK: - Properties

    /// The total number of pages available (defaulted to maximum possible value).
    private var totalNumberOfPages: Int = .max

    /// A flag indicating whether the manager is currently loading data.
    private var isLoading = false

    /// The index of the next page to load.
    private(set) var nextPageIndex: Int = 1

    /// Returns a boolean value indicating whether the manager should load the next page.
    ///
    /// - Returns: `true` if loading is not in progress and the last page has not been reached; otherwise, `false`.
    var shouldLoadNextPage: Bool {
        !isLoading && !hasReachedLastPage
    }
    var isFirstPage: Bool {
        nextPageIndex == 1
    }

    // MARK: - Public Methods

    /// Notifies the manager that loading the next page has started.
    func startLoadingNextPage() {
        isLoading = true
    }

    /// Notifies the manager that loading the current page has ended successfully.
    func loadedPage() {
        nextPageIndex += 1
        isLoading = false
    }

    /// Notifies the manager that loading has finished, but no pages were loaded due to an error.
    func finishedWithError() {
        isLoading = false
    }
    /// Updates the total number of pages based on the value returned from the API.
    ///
    /// - Parameter totalPages: The new total number of pages.
    func updateTotalNumberOfPages(_ totalPages: Int) {
        guard totalPages >= 0 else {
            // Handle invalid totalPages value, e.g., by logging an error
            return
        }
        totalNumberOfPages = totalPages
    }
    /// A method to retrieve the total number of pages in the PagingManager.
    /// - Returns: The total number of pages currently set in the PagingManager.
    func getTotalNumberOfPages() -> Int {
        return totalNumberOfPages
    }

    // MARK: - Private Methods

    /// Returns a boolean value indicating whether the manager has reached the last page.
    private var hasReachedLastPage: Bool {
        nextPageIndex > totalNumberOfPages
    }
}
