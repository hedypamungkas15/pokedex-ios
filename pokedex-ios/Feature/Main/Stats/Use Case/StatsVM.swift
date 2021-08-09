//
//  StatsVM.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation
import RxSwift
import RxCocoa

class StatsVM: BaseViewModel {
    
    private let repository: StatsRepository
    private let disposeBag = DisposeBag()
    private let stateRelay = BehaviorRelay<BasicUIState>(value: .loading)
    
    struct Input {
        
    }
    
    struct Output {
        let state: Driver<BasicUIState>
    }
    
    init(repository: StatsRepository) {
        self.repository = repository
    }
    
    func transform(_ input: Input) -> Output {
        return Output(state: self.stateRelay.asDriver().skip(1))
    }
    
}
