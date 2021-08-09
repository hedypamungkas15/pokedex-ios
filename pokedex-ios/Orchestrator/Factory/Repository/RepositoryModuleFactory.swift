//
//  RepositoryModuleFactory.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation

protocol RepositoryModuleFactory {
    // MARK: - Main
    func makeListRepo() -> ListRepository
    func makeStatsRepo() -> StatsRepository
    func makeEvolutionRepo() -> EvolutionRepository
}
