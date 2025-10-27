//
//  HomeView.swift
//  UIKitCoordinator
//
//  Created by NJ Rojas on 26.10.25.
//

import SwiftUI

struct HomeView: View {

    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        List(viewModel.items) { item in
            Button(item.title) {
                viewModel.onSelectItem?(item)
            }
        }
        .navigationTitle("Movies")
        .toolbar {
            Button("Settings") { viewModel.onOpenSettings?()
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
