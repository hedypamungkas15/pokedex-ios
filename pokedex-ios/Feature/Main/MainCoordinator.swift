//
//  MainCoordinator.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation

class MainCoordinator: BaseCoordinator, MainCoordinatorOutput {
    
    private let router: Router
    private let factory: MainFactory
    
    init(router: Router, factory: MainFactory) {
        self.router = router
        self.factory = factory
    }
    
    override func start() {
        showListView()
    }
    
    private func showListView() {
        let view = factory.makeListView()
        view.onItemTapped = { [weak self] (id, name) in
            guard let self = self else { return }
            self.showDetailView(id: id, name: name)
        }
        router.setRootModule(view)
    }
    
    private func showDetailView(id: String, name: String) {
        let view = factory.makeDetailView()
        view.name = name
        view.statsView.id = id
        view.evolutionView.id = id
        router.present(view, animated: true, mode: .basic, isWrapNavigation: true)
    }
    
}
