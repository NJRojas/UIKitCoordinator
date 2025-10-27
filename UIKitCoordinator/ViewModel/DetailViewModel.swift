//
//  DetailViewModel.swift
//  UIKitCoordinator
//
//  Created by NJ Rojas on 26.10.25.
//

import Foundation

final class DetailViewModel: ObservableObject {

    @Published var movie: Movie

    var showTrailer: (() -> Void)?

    init(movie: Movie) {
        self.movie = movie
    }
}
