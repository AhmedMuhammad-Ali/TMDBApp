//
//  ViewModelProtocol.swift
//  TMDBApp
//
//  Created by Ahmed Ali on 31/01/2024.
//

import Combine
/// A protocol defining the common interface for view models.
protocol ViewModelProtocol {
    /// A publisher that emits view state updates.
    var statePublisher: AnyPublisher<ViewState, Never> { get }
}
