//
//  DatasourceModuleFactory.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation

protocol DataModuleFactory {
    // MARK: - HTTP Client
    func makeBaseIdentifier() -> HTTPIdentifier
    func makeHTTPClient() -> HTTPClient
    
    // MARK: - API
    func makePokemonListAPI() -> PokemonListAPI
    func makeStatsAPI() -> StatsAPI
    func makeEvolutionAPI() -> EvolutionAPI
    func makeSpeciesAPI() -> SpeciesAPI
}
