//
//  NSObject+Extensions.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation

extension NSObject {
    
    class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
