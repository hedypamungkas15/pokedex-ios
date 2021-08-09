//
//  AppDelegate.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private lazy var applicationCoordinator: Coordinator = self.makeCoordinator()
    var rootController: UINavigationController {
        return self.window!.rootViewController as! UINavigationController
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = UINavigationController()
        window!.makeKeyAndVisible()
        
        let notification = launchOptions?[.remoteNotification] as? [String: AnyObject]
        let deepLink = DeepLinkOption.build(with: notification)
        applicationCoordinator.start(with: deepLink)
        return true
    }

    private func makeCoordinator() -> Coordinator {
        return AppCoordinator(
            router: RouterImpl(rootController: self.rootController),
            coordinatorFactory: CoordinatorFactoryImpl()
        )
    }
}

