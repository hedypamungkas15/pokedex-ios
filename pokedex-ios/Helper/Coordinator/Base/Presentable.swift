//
//  Presentable.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation
import UIKit

protocol Presentable {
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {
    
    func toPresent() -> UIViewController? {
        return self
    }
}
