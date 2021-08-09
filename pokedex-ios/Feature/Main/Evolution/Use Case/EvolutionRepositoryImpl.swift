//
//  EvolutionRepositoryImpl.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation
import RxSwift

class EvolutionRepositoryImpl: EvolutionRepository {
    
    private let evolutionAPI: EvolutionAPI
    private let speciesAPI: SpeciesAPI
    private let disposeBag = DisposeBag()
    
    init(evolutionAPI: EvolutionAPI, speciesAPI: SpeciesAPI) {
        self.evolutionAPI = evolutionAPI
        self.speciesAPI = speciesAPI
    }
    
    func requestEvolution(body: SpeciesBody) -> Single<[EvolutionModel]> {
        return Single.create { observer in
            self.speciesAPI
                .request(id: body.id)
                .compactMap { self.modelTransformerFrom($0) }
                .subscribe { body in
                    self.requestEvolutionChain(body: body)
                        .subscribe { model in
                            observer(.success(model))
                        }.disposed(by: self.disposeBag)
                }.disposed(by: self.disposeBag)
            return Disposables.create()
        }
    }
    
    private func requestEvolutionChain(body: EvolutionBody) -> Single<[EvolutionModel]> {
        return Single.create { observer in
            self.evolutionAPI
                .request(id: body.id)
                .map { self.modelTransformerFrom($0) }
                .subscribe { result in
                    observer(.success(result))
                }.disposed(by: self.disposeBag)
            
            return Disposables.create()
        }
    }
    
    private func modelTransformerFrom(_ response: SpeciesResponse) -> EvolutionBody? {
        guard let value = response.evolutionChain?.url else { return nil }
        guard let id = self.extractIdInLastUrl(value) else { return nil }
        return EvolutionBody(id: String(id))
    }
    
    private func modelTransformerFrom(_ response: EvolutionResponse) -> [EvolutionModel] {
        var results = [EvolutionModel]()
        let imageUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
        var items = [SpeciesModel]()
        
        //firstItem
        if let species = response.chain.species {
            if let url = species.url, let id = self.extractIdInLastUrl(url) {
                let first = SpeciesModel(name: species.name, image: "\(imageUrl)\(id).png")
                items.append(first)
            }
        } else {
            return []
        }
        
        //nextItem
        for res in response.chain.evolvesTo {
            if let target = res.evolutionDetails.first, let species = res.species, let url = species.url, let id = self.extractIdInLastUrl(url) {
                let item = SpeciesModel(name: species.name, image: "\(imageUrl)\(id).png")
                items.append(item)
                results.append(EvolutionModel(fromSpecies: items[0], targetSpecies: items[1], level: target.minLevel))
            }
            
            for evo in res.evolvesTo {
                if let target = evo.evolutionDetails.first, let species = evo.species, let url = species.url, let id = self.extractIdInLastUrl(url) {
                    let item = SpeciesModel(name: species.name, image: "\(imageUrl)\(id).png")
                    items.append(item)
                    results.append(EvolutionModel(fromSpecies: items[1], targetSpecies: items[2], level: target.minLevel))
                }
                
                for evols in evo.evolvesTo {
                    if let target = evols.evolutionDetails.first, let species = evols.species, let url = species.url, let id = self.extractIdInLastUrl(url) {
                        let item = SpeciesModel(name: species.name, image: "\(imageUrl)\(id).png")
                        items.append(item)
                        results.append(EvolutionModel(fromSpecies: items[3], targetSpecies: items[4], level: target.minLevel))
                    }
                }
            }
        }
        
        return results
    }
    
    private func extractIdInLastUrl(_ url: String) -> String? {
        guard let target = url.split(separator: "/").last else { return nil }
        return String(target)
    }
}
