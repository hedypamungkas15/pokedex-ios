//
//  BaseView.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation

protocol BaseView: NSObjectProtocol, Presentable, Bindable { }
protocol Bindable {
    func bindViewModel()
}
