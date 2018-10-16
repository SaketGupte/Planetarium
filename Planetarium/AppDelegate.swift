//
//  AppDelegate.swift
//  Planetarium
//
//  Created by Gupte, Saket (Agoda) on 3/10/18.
//  Copyright © 2018 Saket Gupte. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: Builder().build())
        window?.makeKeyAndVisible()
        return true
    }

}

