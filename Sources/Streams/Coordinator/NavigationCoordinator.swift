//
//  NavigationCoordinator.swift
//  Nodal
//
//  Created by Павел Заварин on 25.01.2024.
//

import UIKit

#warning("TODO: Reconsider your approach to this")
/// `UINavigation` Stack Coordinator with Auto-Complete
class NavigationCoordinator<M: CoordinatorMeta>: Coordinator<M>, UINavigationControllerDelegate, UIAdaptivePresentationControllerDelegate {
    var navigationController: UINavigationController

    private(set) var viewControllers: [UIViewController] = []

    private(set) var presentedViewControllers: [UIViewController] = []

    private var transitioning: UIViewControllerAnimatedTransitioning?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }

    override func start(with meta: M) {
        super.start(with: meta)

        navigationController.delegate = self
    }

    override func finish() {
        navigationController.delegate = nil
        navigationController.viewControllers.removeAll { viewControllers.contains($0) }
        viewControllers = []
        presentedViewControllers = []
        parent?.remove(asAny)
        super.finish()
    }

    func navigate(
        to action: Action,
        animated: Bool = true,
        transitioning: UIViewControllerAnimatedTransitioning? = nil,
        completion: (() -> Void)? = nil
    ) {
        self.transitioning = transitioning
        switch action {
        case let .present(controller):
            presentedViewControllers.append(controller)
            controller.presentationController?.delegate = self
            navigationController.viewControllers.last?.present(controller, animated: animated, completion: completion)
        case .dismissTop:
            presentedViewControllers.removeLast()
            navigationController.visibleViewController?.dismiss(animated: animated, completion: completion)
            if presentedViewControllers.isEmpty && viewControllers.isEmpty {
                finish()
            }
        case .dismissAll:
            presentedViewControllers = []
            navigationController.topViewController?.dismiss(animated: animated, completion: completion)
            if viewControllers.isEmpty {
                finish()
            }
        case let .push(controller):
            viewControllers.append(controller)
            navigationController.pushViewController(controller, animated: animated, completion: completion)
        case .root: // Updating of `viewControllers` observed by `pop(to destination:)` !!!
            navigationController.popToRootViewController(animated: animated, completion: completion)
        case .pop: // Updating of `viewControllers` observed by `pop(to destination:)` !!!
            navigationController.popViewController(animated: animated, completion: completion)
        case let .popTo(controller): // Updating of `viewControllers` observed by `pop(to destination:)`
            guard let viewController = viewControllers.first(where: { type(of: $0) == controller }) else { return }
            navigationController.popToViewController(viewController, animated: animated, completion: completion)
        case let .set(controllers):
            viewControllers = controllers
            navigationController.setViewControllers(viewControllers, animated: animated)
            completion?()
        }
    }

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // Detection of animated transition
        guard let sender = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        // If navigationController.viewControllers still contains our sender then it's push, and we're ignore this action
        guard !navigationController.viewControllers.contains(sender) else { return }

        pop(to: viewController)
    }

    private func pop(to destination: UIViewController) {
        guard !viewControllers.isEmpty else { return finish() }

        guard destination !== viewControllers.last else { return }

        // Check if destination controller is in our navigation array
        guard let destinationIndex = viewControllers.firstIndex(of: destination) else {
            // If it's not, we're probably going to another `NavigationCoordinator`
            finish()
            return
        }

        // Destination index should be lower than last index in our stack
        guard let lastIndex = viewControllers.indices.last, destinationIndex < lastIndex else { return }

        let subrange = (destinationIndex + 1) ... lastIndex
        viewControllers.removeSubrange(subrange)
    }

    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        presentedViewControllers.removeLast()
        guard presentedViewControllers.isEmpty && viewControllers.isEmpty else { return }

        finish()
    }

    func navigationController(
        _ navigationController: UINavigationController,
        animationControllerFor operation: UINavigationController.Operation,
        from fromVC: UIViewController,
        to toVC: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
            case .push: return transitioning
            case .pop: return transitioning
            default: return nil
        }
    }

    func navigationController(
        _ navigationController: UINavigationController,
        interactionControllerFor animationController: UIViewControllerAnimatedTransitioning
    ) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
}


extension NavigationCoordinator {
    enum Action {
        case present(UIViewController)
        case push(UIViewController)
        case popTo(UIViewController.Type)
        case set([UIViewController])
        case dismissTop
        case dismissAll
        case root
        case pop
    }
}
