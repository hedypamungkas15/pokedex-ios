//
//  VMModuleFactoryImpl.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation

extension ModuleFactoryImpl: VMModuleFactory {
    
    //MARK: - Main
    func makeListVM() -> ListVM {
        return ListVM(repository: makeListRepo())
    }
    
    func makeStatsVM() -> StatsVM {
        return StatsVM(repository: makeStatsRepo())
    }
    
    func makeEvolutionVM() -> EvolutionVM {
        return EvolutionVM(repository: makeEvolutionRepo())
    }
}
