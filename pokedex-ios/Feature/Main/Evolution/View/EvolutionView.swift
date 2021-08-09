//
//  EvolutionView.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation

protocol EvolutionView: BaseView {
    var viewModel: EvolutionVM! { get set }
    var id: String! { get set }
}
