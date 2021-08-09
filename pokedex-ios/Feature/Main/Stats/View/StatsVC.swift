//
//  StatsVC.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import UIKit
import RxSwift
import RxCocoa
import XLPagerTabStrip

class StatsVC: UIViewController, IndicatorInfoProvider, StatsView {
    
    var viewModel: StatsVM!
    var id: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Stats")
    }
    
    func bindViewModel() {
        
    }

}
