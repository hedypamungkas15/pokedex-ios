//
//  VMModuleFactory.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation

protocol VMModuleFactory {
    // MARK: - Main
    func makeListVM() -> ListVM
    func makeStatsVM() -> StatsVM
    func makeEvolutionVM() -> EvolutionVM
}
