//
//  Coordinator.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation

protocol Coordinator: AnyObject {
    func start()
    func start(with option: DeepLinkOption?)
}
