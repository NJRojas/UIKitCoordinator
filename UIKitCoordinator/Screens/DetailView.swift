//
//  DetailView.swift
//  UIKitCoordinator
//
//  Created by NJ Rojas on 26.10.25.
//

import SwiftUI

struct DetailView: View {

    @ObservedObject var viewModel: DetailViewModel

    var body: some View {
        VStack(spacing: 16) {
            Text(viewModel.movie.synopsis)
                .font(.body)
                .foregroundStyle(.primary)
            Button("Show Trailer") {
                viewModel.showTrailer?()
            }
        }
        .navigationBarTitle(viewModel.movie.title)
        .padding()
    }
}

#Preview {
    let vm = DetailViewModel(
        movie: .init(id: 1, title: "The Green Mile", synopsis: "Paul Edgecomb (Tom Hanks) walked the mile with a variety of cons. He had never encountered someone like John Coffey (Michael Clarke Duncan), a massive black man convicted of brutally killing a pair of young sisters. Coffey had the size and strength to kill anyone, but not the demeanor. Beyond his simple, naive nature and a deathly fear of the dark, Coffey seemed to possess a prodigious, supernatural gift. Paul began to question whether Coffey was truly guilty of murdering the two girls.",
                     trailerURL: URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")
                    )
    )
    vm.showTrailer = { print("DetailView - Close tapped (preview)") }
    return DetailView(viewModel: vm)
}
