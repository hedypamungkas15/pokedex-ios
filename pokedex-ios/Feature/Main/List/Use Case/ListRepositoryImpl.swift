//
//  ListRepositoryImpl.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation
import RxSwift

class ListRepositoryImpl: ListRepository {
    
    private let api: PokemonListAPI
    private let disposeBag = DisposeBag()
    
    init(api: PokemonListAPI) {
        self.api = api
    }
    
    func requestPokemonList(body: PokemonListBody) -> Single<(PokemonListBody?, [ListModel])> {
        return Single.create { observer in
            self.api
                .request(parameters: body.dictionary ?? [String : Any]())
                .map { self.modelTransformerFrom($0) }
                .subscribe { result in
                    observer(.success(result))
                }.disposed(by: self.disposeBag)
            
            return Disposables.create()
        }
    }
    
    private func modelTransformerFrom(_ response: PokemonListResponse) -> (PokemonListBody?, [ListModel]) {
        let nextUrl = self.getOffsetLimit(response.next)
        let item = response.results.map { info -> ListModel? in
            guard let id = info.url.split(separator: "/").last else { return nil }
            guard let url = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png") else { return nil }
            return ListModel(id: String(id), name: info.name, url: url)
        }.compactMap { $0 }
        return (nextUrl, item)
    }
    
    private func getOffsetLimit(_ value: String?) -> PokemonListBody? {
        guard let value = value else { return nil }
        guard let removeSlash = value.split(separator: "/").last else { return nil }
        let removeAnd = removeSlash.split(separator: "&")
        guard let targetOffset = removeAnd.first else { return nil }
        guard let targetLimit = removeAnd.last else { return nil }
        guard let offset = targetOffset.split(separator: "=").last else { return nil }
        guard let limit = targetLimit.split(separator: "=").last else { return nil }
        return PokemonListBody(offset: String(offset), limit: String(limit))
        
    }
}
