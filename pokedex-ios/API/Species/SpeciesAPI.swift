//
//  SpeciesAPI.swift
//  pokedex-ios
//
//  Created by Hedy on 09/08/21.
//

import Foundation
import RxSwift

protocol SpeciesAPI: ClientAPI {
    func request(id: String) -> Single<SpeciesResponse>
}
