//
//  DetailVC.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import UIKit
import XLPagerTabStrip

class DetailVC: ButtonBarPagerTabStripViewController, DetailView {
    
    var statsView: StatsView!
    var evolutionView: EvolutionView!
    var name: String!
    private var isReload = false

    override func viewDidLoad() {
        self.setupXlPagerTab()
        super.viewDidLoad()
        self.setTextNavigation(title: name, navigator: .close)
        self.setupUI()
    }
    
    private func setupUI() {
        buttonBarView.selectedBar.backgroundColor = #colorLiteral(red: 0.3803921569, green: 0.7803921569, blue: 0.7098039216, alpha: 1)
        buttonBarView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    private func setupXlPagerTab() {
        settings.style.buttonBarItemBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        settings.style.buttonBarMinimumLineSpacing = 2
        settings.style.selectedBarHeight = 2
        self.changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            oldCell?.label.textColor = .systemGray
            newCell?.label.textColor = #colorLiteral(red: 0.3803921569, green: 0.7803921569, blue: 0.7098039216, alpha: 1)
        }
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_1 = evolutionView.toPresent()!
        let child_2 = statsView.toPresent()!
        
        guard isReload else {
            return [child_1, child_2]
        }

        var childViewControllers = [child_1, child_2]

        for index in childViewControllers.indices {
            let nElements = childViewControllers.count - index
            let n = (Int(arc4random()) % nElements) + index
            if n != index {
                childViewControllers.swapAt(index, n)
            }
        }
        let nItems = 1 + (arc4random() % 6)
        return Array(childViewControllers.prefix(Int(nItems)))
    }
    
    override func reloadPagerTabStripView() {
        isReload = true
        if arc4random() % 2 == 0 {
            pagerBehaviour = .progressive(skipIntermediateViewControllers: arc4random() % 2 == 0, elasticIndicatorLimit: arc4random() % 2 == 0 )
        } else {
            pagerBehaviour = .common(skipIntermediateViewControllers: arc4random() % 2 == 0)
        }
        super.reloadPagerTabStripView()
    }
    
    func bindViewModel() { }
}
