//
//  EvolutionRepository.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation
import RxSwift

protocol EvolutionRepository {
    func requestEvolution(body: SpeciesBody) -> Single<[EvolutionModel]>
}
