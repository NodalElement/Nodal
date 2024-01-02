//
//  Coordinator.swift
//  Nodal
//
//  Created by Павел Заварин on 02.01.2024.
//

import Foundation
import Combine

protocol CoordinatorMeta {}

/// Base class to operate with flow using coordination pattern.
class Coordinator<Meta: CoordinatorMeta>: NSObject {
    var meta: Meta?

    var onFinish: ((Coordinator<Meta>) -> Void)?

    var cancelBag = Set<AnyCancellable>()

    private(set) var coordinators: [AnyCoordinator] = []

    private(set) weak var parent: AnyCoordinator?

    deinit {
        logger.trace("Coordinator deinit: \(self.meta.debugDescription)")
    }

    func start(with meta: Meta) {
        self.meta = meta
    }

    func finish() {
        onFinish?(self)
    }
}

extension Coordinator {
    func add<M: CoordinatorMeta, C: Coordinator<M>>(
        _ coordinator: C
    ) {
        coordinators.append(coordinator.asAny)
        coordinator.parent = asAny
    }

    func remove<M: CoordinatorMeta, C: Coordinator<M>>(
        _ coordinatorType: C.Type
    ) {
        coordinators.removeAll {
            type(of: $0.coordinator) == coordinatorType
        }
    }

    func remove<M: CoordinatorMeta, C: Coordinator<M>>(
        _ coordinator: C
    ) {
        remove(type(of: coordinator))
    }

    func remove<M: CoordinatorMeta>(
        _ metaType: M.Type
    ) {
        coordinators.removeAll {
            $0.metaType == metaType
        }
    }

    func remove(_ anyCoordinator: AnyCoordinator) {
        coordinators.removeAll {
            $0.metaType == anyCoordinator.metaType
        }
    }

    func removeAll() {
        coordinators.removeAll()
    }
}
