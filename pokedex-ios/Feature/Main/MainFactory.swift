//
//  MainFactory.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation

protocol MainFactory {
    func makeListView() -> ListView
    func makeDetailView() -> DetailView
    func makeStatsView() -> StatsView
    func makeEvolutionView() -> EvolutionView
}
