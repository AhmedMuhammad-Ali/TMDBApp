//
//  FetchMovieDetailsUseCaseTests.swift
//  TMDBAppTests
//
//  Created by Ahmed Ali on 02/02/2024.
//

@testable import TMDBApp
@testable import Networking
@testable import Domain

import XCTest

class FetchMovieDetailsUseCaseTests: XCTestCase {
    // MARK: - Properties
    var sut: FetchMovieDetailsUseCase?

    // MARK: - Lifecycle
    override func setUpWithError() throws {
        try super.setUpWithError()
        SessionManager.shared.configure(protocols: [MockURLProtocol.self])
        MockURLProtocol.mockData["/3/movie/1028703"] = Data(fileName: "MovieDetails")
        sut = DIContainer.shared.resolve(type: FetchMovieDetailsUseCase.self)
    }
    override func tearDownWithError() throws {
        sut = nil
    }

    // MARK: - Tests
    func test_fetchMovieDetails_returnedSuccessfully() async throws {
        let movie = try await sut?.execute(by: 1028703)
        let actualTitle = movie?.title
        let expectedTitle = "The OctoGames"
        XCTAssertEqual(actualTitle, expectedTitle)
    }
}
