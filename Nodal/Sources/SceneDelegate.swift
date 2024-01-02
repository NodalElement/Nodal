//
//  SceneDelegate.swift
//  Nodal
//
//  Created by Павел Заварин on 31.12.2023.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options: UIScene.ConnectionOptions
    ) {
        window = makeWindow(scene)
    }
}

private extension SceneDelegate {
    func makeWindow(_ scene: UIScene) -> UIWindow? {
        guard let windowScene = scene as? UIWindowScene else { return nil }

        let window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window.windowScene = windowScene

        return window
    }
}
