//
//  EvolutionVM.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation
import RxSwift
import RxCocoa

class EvolutionVM: BaseViewModel {
    
    private let repository: EvolutionRepository
    private let disposeBag = DisposeBag()
    private let stateRelay = BehaviorRelay<BasicUIState>(value: .loading)
    private let modelRelay = BehaviorRelay<[EvolutionModel]>(value: [])
    
    struct Input {
        let viewDidLoadRelay: Observable<String?>
    }
    
    struct Output {
        let state: Driver<BasicUIState>
        let model: Driver<[EvolutionModel]>
    }
    
    init(repository: EvolutionRepository) {
        self.repository = repository
    }
    
    func transform(_ input: Input) -> Output {
        self.makeFetch(input)
        return Output(state: self.stateRelay.asDriver().skip(1),
                      model: self.modelRelay.asDriver().skip(1))
    }
    
    private func makeFetch(_ input: Input) {
        input
            .viewDidLoadRelay
            .compactMap { $0 }
            .subscribe(onNext: { id in
                self.stateRelay.accept(.loading)
                self.requestFetch(body: SpeciesBody(id: id))
            }).disposed(by: self.disposeBag)
    }
    
    private func requestFetch(body: SpeciesBody) {
        self.repository
            .requestEvolution(body: body)
            .subscribe { (response) in
                self.modelRelay.accept(response)
                self.stateRelay.accept(.close)
            } onFailure: { error in
                self.stateRelay.accept(.failure(error.readableError))
            }.disposed(by: self.disposeBag)
    }
    
}
