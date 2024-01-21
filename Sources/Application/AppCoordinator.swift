//
//  AppCoordinator.swift
//  Nodal
//
//  Created by Павел Заварин on 02.01.2024.
//

import UIKit

struct AppMeta: CoordinatorMeta {
    let connectionOptions: UIScene.ConnectionOptions
}

final class AppCoordinator: Coordinator<AppMeta> {
    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
        super.init()
    }

    override func start(with meta: AppMeta) {
        super.start(with: meta)

        #if DEBUG
        showSplash()
        #endif
        showMain()
    }
}

private extension AppCoordinator {
    /// Application main screen for authorized users
    func showMain() {
        let coordinator = MainCoordinator(
            window: window
        )
        coordinator.onFinish = { [unowned self] coordinator in
            self.remove(coordinator)
        }
        add(coordinator)
        coordinator.start(with: .init())
    }

    func showSplash() {
        let coordinator = SplashCoordinator()
        coordinator.onFinish = { [unowned self] in
            self.remove($0)
        }
        add(coordinator)
        coordinator.start(with: SplashMeta())
    }
}
