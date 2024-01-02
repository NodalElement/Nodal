//
//  SplashCoordinator.swift
//  Nodal
//
//  Created by Павел Заварин on 02.01.2024.
//

import UIKit

struct SplashMeta: CoordinatorMeta { }

final class SplashCoordinator: Coordinator<SplashMeta> {
    private var window: UIWindow?

    override func start(with meta: SplashMeta) {
        super.start(with: meta)

        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            assertionFailure("Can't find UIWindowScene for Splash Screen")
            return
        }

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.windowLevel = .alert
        window?.rootViewController = UIViewController() // Сюда можно вставить любой UIViewController
        window?.makeKeyAndVisible()
    }
}

private extension SplashCoordinator {
    func hideSplashScreenWindow() {
        UIView.animate(
            withDuration: 0.4,
            delay: .zero,
            options: .curveEaseInOut
        ) {
            self.window?.alpha = .zero
        } completion: { [weak self] _ in
            self?.window?.isHidden = true
            self?.window?.windowScene = nil
            self?.window = nil
            self?.finish()
        }
    }
}
