//
//  CoordinatorFactoryImpl.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation
import UIKit

class CoordinatorFactoryImpl: CoordinatorFactory {
    
    // MARK: - Main
    func makeMainCoordinator(router: Router) -> Coordinator & MainCoordinatorOutput {
        return MainCoordinator(router: router, factory: ModuleFactoryImpl())
    }
    
    //--------------------------------------------------------------------------------------------------
    private func router(_ navController: UINavigationController?) -> Router {
        return RouterImpl(rootController: navigationController(navController))
    }
    
    private func navigationController(_ navController: UINavigationController?) -> UINavigationController {
        if let navController = navController {
            return navController
        } else {
            return UINavigationController.controllerFromStoryboard(.main)
        }
    }
    
}
