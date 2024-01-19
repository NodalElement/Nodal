//
//  SceneDelegate.swift
//  Nodal
//
//  Created by Павел Заварин on 31.12.2023.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    var coordinator: AnyCoordinator?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options: UIScene.ConnectionOptions
    ) {
        window = makeWindow(scene)
        #if DEBUG
            start() // For testing purposes only
        #else
            coordinator = makeCoordinator(options)
        #endif
    }
}

private extension SceneDelegate {
    func makeWindow(_ scene: UIScene) -> UIWindow? {
        guard let windowScene = scene as? UIWindowScene else { return nil }

        let window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window.windowScene = windowScene

        return window
    }

    func makeCoordinator(_ connectionOptions: UIScene.ConnectionOptions) -> AnyCoordinator? {
        guard let window else { return nil }

        let coordinator = AppCoordinator(window: window)
        coordinator.start(with: .init(connectionOptions: connectionOptions))

        return coordinator.asAny
    }

    /// Для проверки различных решений, необходимых в работе
    @available(*, deprecated, message: "Use for testing purposes only")
    func start() {
        let redController = UIViewController()
        redController.view.backgroundColor = .red

        let yellowController = UIViewController()
        yellowController.view.backgroundColor = .yellow

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [redController, yellowController]

        window?.rootViewController = UINavigationController(rootViewController: tabBarController)
        window?.makeKeyAndVisible()
    }
}
