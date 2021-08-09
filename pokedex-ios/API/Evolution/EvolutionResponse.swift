//
//  EvolutionResponse.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation

struct EvolutionResponse: Codable {
    let chain: EvolutionChain
}

struct EvolutionChain: Codable {
    let evolvesTo: [EvolutionTarget]
    let species: EvolutionSpecies?
}

struct EvolutionTarget: Codable {
    let evolutionDetails: [EvolutionDetails]
    let species: EvolutionSpecies?
    let evolvesTo: [EvolutionTarget]
}

struct EvolutionDetails: Codable {
    let minLevel: Int?
}

struct EvolutionSpecies: Codable {
    let name: String?
    let url: String?
}
