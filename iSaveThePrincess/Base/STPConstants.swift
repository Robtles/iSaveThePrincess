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
     * VALUES 
     **********/
    
    // Range of possible ages for a soldier
    static let kSoldierAges: [Int] = Array(10...40)
    
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
    
    // Delete this soldier String
    static let kDeleteThisSoldierString = "Delete this soldier?"
    
    // Confirm String
    static let kConfirmString = "Confirm"
    
    // No String
    static let kNoString = "No"
    
    // Soldier Name String
    static let kSoldierNameString = "Soldier name"
    
    // Color String
    static let kColorString = "Color"
    
    // Gender String
    static let kGenderString = "Gender"
    
    // Age String
    static let kAgeString = "Age"
    
    // Update String
    static let kUpdateString = "Update"
    
    // Create String
    static let kCreateString = "Create"
    
    // Delete String
    static let kDeleteString = "Delete"
    
    // No soldier error String
    static let kNoSoldierErrorMessageString = "You need to add at least one soldier to be able to attack the door!"
    
    // Could not save soldier String
    static let kCouldNotSaveSoldierString = "Could not save soldier. Please try again."
    
    // Could not delete soldier String
    static let kCouldNotDeleteSoldierString = "Could not delete soldier. Please try again."
    
    // Please Enter a Name String
    static let kPleaseEnterANameString = "Please enter a name for this soldier."
    
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
    
    // Application darker text color
    static let kApplicationDarkerTextColor = UIColor(hexString: "121212")
    
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
    
    // Semibold header font
    static let kSemiboldHeaderFont = UIFont.systemFont(ofSize: 13.0, weight: UIFontWeightSemibold)
    
    // Small font
    static let kApplicationSmallFont = UIFont.systemFont(ofSize: 12.0, weight: UIFontWeightThin)
}
