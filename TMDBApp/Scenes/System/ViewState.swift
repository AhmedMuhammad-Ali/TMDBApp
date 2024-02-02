//
//  ViewState.swift
//  TMDBApp
//
//  Created by Ahmed Ali on 01/02/2024.
//

import Foundation
/// An enumeration representing the state of a view or component.
enum ViewState {
    /// The view is in an idle state with no specific activity.
    case idle

    /// The view is in an empty state, indicating that there is no data to display.
    case empty

    /// The view is in a loading state, indicating that some operation is in progress.
    case loading

    /// The view is in an error state, with an associated error that provides details about the error condition.
    case error(Error)
}
