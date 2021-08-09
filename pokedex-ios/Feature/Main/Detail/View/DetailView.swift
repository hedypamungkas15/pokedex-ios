//
//  DetailView.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation

protocol DetailView: BaseView {
    var statsView: StatsView! { get set }
    var evolutionView: EvolutionView! { get set }
    var name: String! { get set }
}
