//
//  EvolutionModel.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation

struct EvolutionModel {
    let fromSpecies: SpeciesModel
    let targetSpecies: SpeciesModel
    let level: Int?
}

struct SpeciesModel {
    let name: String?
    let image: String?
}
