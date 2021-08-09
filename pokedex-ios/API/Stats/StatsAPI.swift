//
//  StatsAPI.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation
import RxSwift

protocol StatsAPI: ClientAPI {
    func request(parameters: [String: Any]) -> Single<StatsResponse>
}
