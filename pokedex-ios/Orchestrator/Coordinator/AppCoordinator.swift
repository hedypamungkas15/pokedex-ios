//
//  AppCoordinator.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation

fileprivate enum LaunchInstructor {
    case main
    
    static func configure() -> LaunchInstructor {
        return .main
    }
}

final class AppCoordinator: BaseCoordinator {
    
    private let router: Router
    private let coordinatorFactory: CoordinatorFactory
    
    private var instructor: LaunchInstructor {
        return LaunchInstructor.configure()
    }
    
    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start(with option: DeepLinkOption?) {
        //start with deepLink
        if let option = option {
            self.startWith(deeplink: option)
        } else {
            self.startBasicFlow()
        }
    }
    
    private func startWith(deeplink: DeepLinkOption) {
        switch deeplink {
        case .test:
            if let coordinator = childCoordinators.first {
                self.runMainFlow(with: deeplink)
                self.router.dismissModule()
                self.removeDependency(coordinator)
            }
        }
    }
    
    private func startBasicFlow() {
        switch self.instructor {
        case .main:
            self.runMainFlow()
        }
    }
    
    private func runMainFlow(with option: DeepLinkOption? = nil) {
        let coordinator = coordinatorFactory.makeMainCoordinator(router: self.router)
        addDependency(coordinator)
        coordinator.start()
    }
}
