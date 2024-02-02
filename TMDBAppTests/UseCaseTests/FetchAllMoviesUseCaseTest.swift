//
//  FetchAllMoviesUseCaseTest.swift
//  TMDBAppTests
//
//  Created by Ahmed Ali on 02/02/2024.
//

@testable import TMDBApp
@testable import Networking
@testable import Domain

import XCTest

class FetchAllMoviesUseCaseTest: XCTestCase {
    // MARK: - Properties
    var sut: FetchAllMoviesUseCase?

    // MARK: - Lifecycle
    override func setUpWithError() throws {
        try super.setUpWithError()
        SessionManager.shared.configure(protocols: [MockURLProtocol.self])
        MockURLProtocol.mockData["/3/discover/movie"] = Data(fileName: "MoviesList")
        sut = DIContainer.shared.resolve(type: FetchAllMoviesUseCase.self)
    }
    override func tearDownWithError() throws {
        sut = nil
    }

    // MARK: - Tests
    func test_fetchAllMovies_returnedSuccessfully() async throws {
        let movies = try await sut?.execute(for: 1)
        let actualTitle = movies?.movies.first?.title
        let expectedTitle = "Aquaman and the Lost Kingdom"
        XCTAssertEqual(actualTitle, expectedTitle)
    }
}
