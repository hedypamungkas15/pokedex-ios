//
//  ScheduleProvider.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation
import RxSwift

class ScheduleProvider {
    
    static let shared: ScheduleProvider = ScheduleProvider()
    
    public let main = MainScheduler.instance
    public let background = ConcurrentDispatchQueueScheduler(qos: DispatchQoS.background)
}
