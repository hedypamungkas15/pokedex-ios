//
//  MainFactoryImpl.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation

extension ModuleFactoryImpl: MainFactory {
    
    func makeListView() -> ListView {
        let vc = ListVC()
        vc.viewModel = makeListVM()
        return vc
    }
    
    func makeDetailView() -> DetailView {
        let vc = DetailVC()
        vc.statsView = makeStatsView()
        vc.evolutionView = makeEvolutionView()
        return vc
    }
    
    func makeStatsView() -> StatsView {
        let vc = StatsVC()
        vc.viewModel = makeStatsVM()
        return vc
    }
    
    func makeEvolutionView() -> EvolutionView {
        let vc = EvolutionVC()
        vc.viewModel = makeEvolutionVM()
        return vc
    }
}
