//
//  PokemonListResponse.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation

struct PokemonListResponse: Codable {
    let next: String?
    let results: [PokemonstListInfo]
}

struct PokemonstListInfo: Codable {
    let name: String
    let url: String
}
