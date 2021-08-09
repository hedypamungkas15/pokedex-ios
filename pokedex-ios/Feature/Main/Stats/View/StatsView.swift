//
//  StatsView.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation

protocol StatsView: BaseView {
    var viewModel: StatsVM! { get set }
    var id: String! { get set }
}
