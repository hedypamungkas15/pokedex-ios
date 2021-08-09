//
//  DatasourceModuleFactoryImpl.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation

class ModuleFactoryImpl: DataModuleFactory {
    
    //MARK: - HTTP Client
    func makeBaseIdentifier() -> HTTPIdentifier {
        return BaseIdentifier()
    }
    
    func makeHTTPClient() -> HTTPClient {
        return HTTPClientImpl(identifier: makeBaseIdentifier())
    }
    
    //MARK: - API
    func makePokemonListAPI() -> PokemonListAPI {
        return PokemonListAPIImpl(httpClient: makeHTTPClient())
    }
    
    func makeStatsAPI() -> StatsAPI {
        return StatsAPIImpl(httpClient: makeHTTPClient())
    }
    
    func makeEvolutionAPI() -> EvolutionAPI {
        return EvolutionAPIImpl(httpClient: makeHTTPClient())
    }
    
    func makeSpeciesAPI() -> SpeciesAPI {
        return SpeciesAPIImpl(httpClient: makeHTTPClient())
    }
}
