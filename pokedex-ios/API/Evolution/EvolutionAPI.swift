//
//  EvolutionAPI.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation
import RxSwift

protocol EvolutionAPI: ClientAPI {
    func request(id: String) -> Single<EvolutionResponse>
}
