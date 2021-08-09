//
//  BaseViewModel.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation

protocol BaseViewModel {
    associatedtype Input
    associatedtype Output
    
    func transform(_ input: Input) -> Output
}
