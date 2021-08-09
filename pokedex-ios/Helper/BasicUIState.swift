//
//  BasicUIState.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation

enum BasicUIState {
    case close
    case loading
    case success(String)
    case failure(String)
    case warning(String)
}
