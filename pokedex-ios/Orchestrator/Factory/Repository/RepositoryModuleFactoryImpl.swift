//
//  RepositoryModuleFactoryImpl.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation

extension ModuleFactoryImpl: RepositoryModuleFactory {
    
    //MARK: - Main
    func makeListRepo() -> ListRepository {
        return ListRepositoryImpl(api: makePokemonListAPI())
    }
    
    func makeStatsRepo() -> StatsRepository {
        return StatsRepositoryImpl(api: makeStatsAPI())
    }
    
    func makeEvolutionRepo() -> EvolutionRepository {
        return EvolutionRepositoryImpl(evolutionAPI: makeEvolutionAPI(), speciesAPI: makeSpeciesAPI())
    }
}
