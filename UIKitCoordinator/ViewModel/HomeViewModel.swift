//
//  HomeViewModel.swift
//  UIKitCoordinator
//
//  Created by NJ Rojas on 26.10.25.
//

import SwiftUI

final class HomeViewModel: ObservableObject {

    @Published var items: [Movie] = [
        .init(
            id: 1,
            title: "Matrix",
            synopsis: "Neo, a computer programmer and hacker, has always questioned the reality of the world around him. His suspicions are confirmed when Morpheus, a rebel leader, contacts him and reveals the truth to him. \n\nThe Matrix is a dystopian science fiction film directed by the Wachowski Sisters.",
            trailerURL: URL(string: "https://www.youtube.com/embed/YB-Y_iXjYcQ")
            
        ),
        .init(
            id: 2,
            title: "Lord of the Rings",
            synopsis: "The Lord of the Rings is a high-fantasy trilogy directed by Peter Jackson.",
            trailerURL: URL(string: "https://www.youtube.com/watch?v=V75dMMIW2B4")
        )
    ]

    var onSelectItem: ((Movie) -> Void)?

    var onOpenSettings: (() -> Void)?
}

/// For testing
extension HomeViewModel {
    
    // Intent helpers (nice for unit tests)
    func didTap(item: Movie) {
        onSelectItem?(item)
    }
    
    func didTapOpenSettings() {
        onOpenSettings?()
    }
}
