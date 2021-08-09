//
//  StatsRepositoryImpl.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation
import RxSwift

class StatsRepositoryImpl: StatsRepository {
    
    private let api: StatsAPI
    private let disposeBag = DisposeBag()
    
    init(api: StatsAPI) {
        self.api = api
    }
}
