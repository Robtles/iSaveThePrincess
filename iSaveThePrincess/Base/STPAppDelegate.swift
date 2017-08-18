//
//  AppDelegate.swift
//  iSaveThePrincess
//
//  Created by Robin on 18/08/2017.
//  Copyright © 2017 Rob. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func applicationDidFinishLaunching(_ application: UIApplication) {
        
        // Status bar initially hidden from the Info.plist file, then show it again.
        UIApplication.shared.isStatusBarHidden = false
    }
}

