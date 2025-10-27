//
//  AppCoordinator.swift
//  UIKitCoordinator
//
//  Created by NJ Rojas on 26.10.25.
//

import SwiftUI
import SafariServices

protocol Coordinator: AnyObject {
    func start()
}

final class AppCoordinator: Coordinator {
    let window: UIWindow
    let nav = UINavigationController()

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let vm = HomeViewModel()
        vm.onSelectItem = { [weak self] item in
            self?.showDetail(for: item)
        }
        vm.onOpenSettings = { [weak self] in
            self?.presentSettings()
        }
        let vc = UIHostingController(rootView: HomeView(viewModel: vm))
        nav.setViewControllers([vc], animated: false)

        window.rootViewController = nav
        window.makeKeyAndVisible()
    }

    private func showDetail(for item: Movie) {
        let vm = DetailViewModel(movie: item)
        vm.showTrailer = { [weak self] in
            guard let url = item.trailerURL else { return }
            self?.openExternal(url)
        }
        let vc = UIHostingController(rootView: DetailView(viewModel: vm))
        nav.pushViewController(vc, animated: true)
    }

    func presentSettings() {
        let vm = SettingsViewModel()
        vm.onDone = { [weak self] in
            self?.nav.dismiss(animated: true)
        }
        let vc = UIHostingController(rootView: SettingsView(viewModel: vm))
        nav.present(UINavigationController(rootViewController: vc), animated: true)
    }
}

// MARK: - URL helpers
private extension AppCoordinator {
    func openExternal(_ url: URL) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
