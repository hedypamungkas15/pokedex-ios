//
//  UIINavigationController+Extensions.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setTextNavigation(title: String, navigator: AMViewNavigatorType = .none, navigatorCallback: Selector? = nil) {
        self.setupTitleForNavigation(title: title)
        self.setupNavigatorForNavigation(type: navigator, navigatorCallback: navigatorCallback)
    }
    
    func setImageNavigation(navigator: AMViewNavigatorType = .none, navigatorCallback: Selector? = nil) {
        self.setupImageForNavigation()
        self.setupNavigatorForNavigation(type: navigator, navigatorCallback: navigatorCallback)
    }
    
    private func setupTitleForNavigation(title: String) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.title = title
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    private func setupImageForNavigation() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        let logo = UIImage(named: "")
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView
    }
    
    private func setupNavigatorForNavigation(type: AMViewNavigatorType, navigatorCallback: Selector? = nil) {
        if let callback = navigatorCallback {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: type.icon, style: .plain, target: self, action: callback)
        } else {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: type.icon, style: .plain, target: self, action: type.callback)
        }
    }
    
    enum AMViewNavigatorType {
        case none
        case back
        case close
        
        var icon: UIImage {
            switch self {
            case .none:
                return UIImage()
            case .back:
                return UIImage(named: "ic_back")!
            case .close:
                return UIImage(named: "ic_close")!
            }
        }
        
        var callback: Selector {
            switch self {
            case .none:
                return #selector(onBlankTapped)
            case .back:
                return #selector(onBackTapped)
            case .close:
                return #selector(onCloseTapped)
            }
        }
        
    }
    
    
    @objc private func onBlankTapped() { }
    
    @objc private func onBackTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func onCloseTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
