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
    
    // Add String
    static let kAddString = "Add"
    
    // Error String
    static let kErrorString = "Error"
    
    // No soldier error String
    static let kNoSoldierErrorMessage = "You need to add at least one soldier to be able to attack the door!"
    
    // Ok String
    static let kOkString = "Ok"
    
    // No soldiers label String
    static let kNoSoldiersLabelString = "No soldier added yet."
    
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

    // Application title font
    static let kApplicationTitleFont = UIFont.boldSystemFont(ofSize: 22.0)
    
    // Application button font
    static let kApplicationButtonFont = UIFont.boldSystemFont(ofSize: 18.0)
    
    // Standard font
    static let kApplicationStandardFont = UIFont.systemFont(ofSize: 14.0)
}
