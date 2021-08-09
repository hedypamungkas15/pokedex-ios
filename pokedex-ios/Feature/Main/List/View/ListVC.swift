//
//  ListVC.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class ListVC: UIViewController, ListView {
    
    var viewModel: ListVM!
    var onItemTapped: ((String, String) -> Void)?
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var model: [ListModel] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    private let viewDidLoadRelay = PublishRelay<Void>()
    private let loadMoreRelay = PublishRelay<Void>()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTextNavigation(title: "Pokemon")
        self.setupTableView()
        self.bindViewModel()
        
        self.viewDidLoadRelay.accept(())
    }
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func bindViewModel() {
        let input = ListVM.Input(viewDidLoadRelay: viewDidLoadRelay.asObservable(), loadMoreRelay: loadMoreRelay.asObservable())
        let output = viewModel.transform(input)
        output.state.drive(self.rx.state).disposed(by: self.disposeBag)
        output.model.drive { data in
            self.model.append(contentsOf: data)
        }.disposed(by: self.disposeBag)

    }

}

extension ListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        let target = self.model[indexPath.row]
        cell.textLabel?.text = target.name
        cell.detailTextLabel?.text = "#\(target.id)"
        cell.imageView?.kf.setImage(with: target.url, placeholder: nil, options: nil) { _ in
            cell.setNeedsLayout()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastIndex = self.model.count - 1
        if indexPath.row == lastIndex {
            self.loadMoreRelay.accept(())
        }
    }
    
    
}

extension ListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let target = self.model[indexPath.row]
        self.onItemTapped?(target.id, target.name)
    }
}
