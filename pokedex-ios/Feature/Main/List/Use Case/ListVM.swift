//
//  ListVM.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation
import RxSwift
import RxCocoa

class ListVM: BaseViewModel {
    
    private let repository: ListRepository
    private let disposeBag = DisposeBag()
    private let stateRelay = BehaviorRelay<BasicUIState>(value: .loading)
    private let modelRelay = BehaviorRelay<[ListModel]>(value: [])
    private var anyNextUrl: PokemonListBody?
    
    struct Input {
        let viewDidLoadRelay: Observable<Void>
        let loadMoreRelay: Observable<Void>
    }
    
    struct Output {
        let state: Driver<BasicUIState>
        let model: Driver<[ListModel]>
    }
    
    init(repository: ListRepository) {
        self.repository = repository
    }
    
    func transform(_ input: Input) -> Output {
        self.makeFetch(input)
        self.makeLoadMore(input)
        return Output(state: self.stateRelay.asDriver().skip(1),
                      model: self.modelRelay.asDriver().skip(1))
    }
    
    private func makeFetch(_ input: Input) {
        input
            .viewDidLoadRelay
            .subscribe { _ in
                self.stateRelay.accept(.loading)
                self.requestFetch()
            }.disposed(by: self.disposeBag)
    }
    
    private func makeLoadMore(_ input: Input) {
        input
            .loadMoreRelay
            .subscribe { _ in
                guard let body = self.anyNextUrl else { return }
                self.requestFetchWith(body: body)
            }.disposed(by: self.disposeBag)

    }
    
    private func requestFetch() {
        self.requestFetchWith(body: PokemonListBody(offset: nil, limit: nil))
    }
    
    private func requestFetchWith(body: PokemonListBody) {
        self.repository
            .requestPokemonList(body: body)
            .subscribe { (response) in
                self.anyNextUrl = response.0
                self.modelRelay.accept(response.1)
                self.stateRelay.accept(.close)
            } onFailure: { error in
                self.stateRelay.accept(.failure(error.readableError))
            }.disposed(by: self.disposeBag)
    }
    
}
