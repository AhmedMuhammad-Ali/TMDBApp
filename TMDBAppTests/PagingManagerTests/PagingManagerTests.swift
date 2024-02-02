//
//  PagingManagerTests.swift
//  TMDBAppTests
//
//  Created by Ahmed Ali on 02/02/2024.
//

@testable import TMDBApp

import XCTest

class PagingManagerTests: XCTestCase {

    func testShouldLoadNextPage_WhileLoading_ReturnsFalse() throws {
        // Given
        let pagingController = PagingManager()
        pagingController.startLoadingNextPage()

        // When & Then
        XCTAssertFalse(pagingController.shouldLoadNextPage)
    }

    func testShouldLoadNextPage_IfNothingIsLoading_ReturnsTrue() throws {
        // Given
        let pagingController = PagingManager()

        // When & Then
        XCTAssertTrue(pagingController.shouldLoadNextPage)
    }

    func testShouldLoadNextPage_IfLastPageNotLoaded_ReturnsTrue() throws {
        // Given
        let pagingController = PagingManager()
        pagingController.startLoadingNextPage()

        // When
        pagingController.loadedPage()

        // Then
        XCTAssertTrue(pagingController.shouldLoadNextPage)
    }

    func testShouldLoadNextPage_IfLastPageNotLoadedButStartedLoading_ReturnsFalse() throws {
        // Given
        let pagingController = PagingManager()
        pagingController.startLoadingNextPage()

        // When
        pagingController.loadedPage()
        pagingController.startLoadingNextPage()

        // Then
        XCTAssertFalse(pagingController.shouldLoadNextPage)
    }
    
    func testUpdateTotalNumberOfPages_WithValidInput_SetsTotalNumberOfPages() {
        // Given
        let pagingController = PagingManager()
        let totalPages = 10

        // When
        pagingController.updateTotalNumberOfPages(totalPages)

        // Then
        XCTAssertEqual(pagingController.getTotalNumberOfPages(), totalPages)
    }
}
