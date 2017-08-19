//
//  STPConstants.swift
//  iSaveThePrincess
//
//  Created by Robin on 19/08/2017.
//  Copyright © 2017 Rob. All rights reserved.
//

import UIKit
import EZSwiftExtensions

struct Constants {
    
    /**********
     * STRINGS
     **********/
    
    // Soldiers String
    static let kSoldiersString = "Soldiers"
    
    // Attack the Door String
    static let kAttackTheDoorString = "Attack the Door!"
    
    // Soldier type names
    static let kSoldierTypeNames = ["Male",
                                    "Female",
                                    "Other"]
    
    /**********
     * COLORS
     **********/
    
    // Application blue tint color - main
    static let kApplicationBlueTintColor = UIColor(hexString: "07BDF7")
    
    // Application darker blue gradient
    static let kApplicationDarkerBlueGradientColors: [CGColor] = [UIColor.blue.cgColor,
                                                                  UIColor.black.cgColor]
    
    /**********
     * FONTS
     **********/
    
    // Application button font
    static let kApplicationButtonFont = UIFont.boldSystemFont(ofSize: 18.0)
}
