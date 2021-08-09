//
//  SpeciesResponse.swift
//  pokedex-ios
//
//  Created by Hedy on 09/08/21.
//

import Foundation

struct SpeciesResponse: Codable {
    let evolutionChain: SpeciesEvolution?
}

struct SpeciesEvolution: Codable {
    let url: String?
}
