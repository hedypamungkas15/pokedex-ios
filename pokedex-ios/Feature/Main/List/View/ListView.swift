//
//  ListView.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation

protocol ListView: BaseView {
    var viewModel: ListVM! { get set }
    var onItemTapped: ((String, String) -> Void)? { get set }
}
