//
//  TabBarController.swift
//  Nodal
//
//  Created by Павел Заварин on 02.01.2024.
//

import UIKit

final class TabBarController: UITabBarController {
    var didSelectTab: ((Tab) -> Bool)?

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
        tabBar.backgroundColor = .white
        tabBar.unselectedItemTintColor = .clear
        tabBar.tintColor = .white
    }
    
    func fill(with items: [Item]) {
        viewControllers = items.map {
            $0.viewController.tabBarItem = UITabBarItem(
                title: $0.tab.title,
                image: nil,
                selectedImage: nil
            )
            $0.viewController.tabBarItem.imageInsets = .all(.zero).with(bottom: Spacing.halfOfStandard)
            return $0.viewController
        }
    }
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let index = viewControllers?.firstIndex(where: { $0 === viewController })
        guard let index, let tab = Tab(rawValue: index) else { return true }

        return didSelectTab?(tab) ?? true
    }
}

// MARK: - Nested Types

extension TabBarController {
    struct Item {
        let tab: Tab
        let viewController: UIViewController
    }
    
    enum Tab: Int {
        case main
        case settings

        var title: String {
            switch self {
            case .main:     return "Main"
            case .settings: return "Settings"
            }
        }
    }
}
