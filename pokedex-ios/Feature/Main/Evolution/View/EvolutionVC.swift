//
//  EvolutionVC.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import UIKit
import RxSwift
import RxCocoa
import XLPagerTabStrip
import Kingfisher

class EvolutionVC: UIViewController, IndicatorInfoProvider, EvolutionView {
    
    var viewModel: EvolutionVM!
    var id: String!
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var model: [EvolutionModel] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    private let viewDidLoadRelay = BehaviorRelay<String?>(value: nil)
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.bindViewModel()
        
        self.viewDidLoadRelay.accept(self.id)
    }
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let nib = UINib(nibName: "EvolutionCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "EvolutionCell")
    }
    
    func bindViewModel() {
        let input = EvolutionVM.Input(viewDidLoadRelay: viewDidLoadRelay.asObservable())
        let output = viewModel.transform(input)
        output.state.drive(self.rx.state).disposed(by: self.disposeBag)
        output.model.drive { data in
            self.model.append(contentsOf: data)
        }.disposed(by: self.disposeBag)
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Evolutions")
    }
    
}

extension EvolutionVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EvolutionCell", for: indexPath)  as! EvolutionCell
        let target = self.model[indexPath.row]
        cell.setup(model: target)
        return cell
    }
    
    
}

extension EvolutionVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
