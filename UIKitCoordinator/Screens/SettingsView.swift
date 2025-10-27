//
//  SettingsView.swift
//  UIKitCoordinator
//
//  Created by NJ Rojas on 26.10.25.
//

import SwiftUI

struct SettingsView: View {

    @ObservedObject var viewModel: SettingsViewModel

    var body: some View {
        List {
            Text("some options")
                .font(.headline)
        }
        .navigationTitle("Settings")
        .toolbar {
            Button("Done") {
                viewModel.onDone?()
            }
        }
        .padding()
    }
}

#Preview {
    SettingsView(viewModel: SettingsViewModel())
}
