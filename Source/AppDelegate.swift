//
//  AppDelegate.swift
//  UCLKit
//
//  Created by Tiago Ferreira on 15/02/2018.
//  Copyright © 2018 Tiago Ferreira. All rights reserved.
//

import UIKit

@UIApplicationMain class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?

    // MARK: - UIApplicationDelegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if let splitViewController = window!.rootViewController as? UISplitViewController,
        let navigationController = splitViewController.viewControllers.last as? UINavigationController {
            navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
            splitViewController.delegate = self
        }
        return true
    }

    // MARK: - UISplitViewControllerDelegate

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if let secondaryAsNavController = secondaryViewController as? UINavigationController,
        let _ = secondaryAsNavController.topViewController as? DetailViewController {
            return true
        }

        return false
    }
}
