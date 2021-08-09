//
//  CoordinatorFactory.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation
import UIKit

protocol CoordinatorFactory {
    // MARK: - Main
    func makeMainCoordinator(router: Router) -> Coordinator & MainCoordinatorOutput

}
