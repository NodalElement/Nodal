//
//  AnyCoordinator.swift
//  Nodal
//
//  Created by Павел Заварин on 02.01.2024.
//

import Foundation

/// Type erasure for `Coordinator`
final class AnyCoordinator {
    let coordinator: Any
    let metaType: CoordinatorMeta.Type
    let id: String

    func remove(_ anyCoordinator: AnyCoordinator) {
        onRemove(anyCoordinator)
    }

    private let onRemove: (AnyCoordinator) -> Void

    init<M: CoordinatorMeta, C: Coordinator<M>>(
        _ coordinator: C
    ) {
        self.coordinator = coordinator
        onRemove = { [unowned coordinator] anyCoordinator in
            coordinator.remove(anyCoordinator)
        }
        metaType = M.self
        id = String(describing: C.self)
    }
}

extension AnyCoordinator: Equatable, Hashable {
    static func == (lhs: AnyCoordinator, rhs: AnyCoordinator) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Coordinator {
    var asAny: AnyCoordinator {
        AnyCoordinator(self)
    }
}
