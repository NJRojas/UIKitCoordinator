//
//  HomeViewModelTests.swift
//  UIKitCoordinatorTests
//
//  Created by NJ Rojas on 27.10.25.
//

import XCTest

@testable import UIKitCoordinator

final class HomeViewModelTests: XCTestCase {

    func testHomeViewModel_onOpenSettings_emitsIntent() {

        let vm = HomeViewModel()
        
        let exp = expectation(description: "onOpenSettings emitted")
        vm.onOpenSettings = { exp.fulfill() }
        
        vm.didTapOpenSettings()
        
        wait(for: [exp], timeout: 0.1)
    }
    
    func testHomeViewModel_onSelectItem_emitsSelectedMovie() {

        let vm = HomeViewModel()
        let target = Movie(id: 99, title: "Test Movie", synopsis: "About the Movie", trailerURL: nil)
        
        let exp = expectation(description: "onSelectItem with movie")
        var received: Movie?
        
        vm.onSelectItem = { movie in
            received = movie
            exp.fulfill()
        }
        
        vm.didTap(item: target)
        
        wait(for: [exp], timeout: 0.1)
        XCTAssertEqual(received?.id, target.id)
        XCTAssertEqual(received?.title, target.title)
    }
}
