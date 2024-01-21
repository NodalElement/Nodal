//
//  MainCoordinator.swift
//  Nodal
//
//  Created by Павел Заварин on 02.01.2024.
//

import UIKit

/// Meta Type for working with deep links in the future (maybe)
struct MainMeta: CoordinatorMeta { }

final class MainCoordinator: Coordinator<MainMeta> {
    private let window: UIWindow

    private lazy var tabBarController: TabBarController = .init()

    init(window: UIWindow) {
        self.window = window
        super.init()
    }

    override func start(with meta: MainMeta) {
        super.start(with: meta)
    }
}
