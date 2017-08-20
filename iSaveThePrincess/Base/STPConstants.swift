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
    
    // HP bar width constant
    static let kHPBarWidth: CGFloat = 126.0
    
    // Door durability
    static let kDoorDurability: CGFloat = 100.0
    
    /**********
     * SEGUES
     **********/
    
    // To Battle Screen Segue
    static let kToBattleScreenSegue = "toBattleScreenSegue"
    
    /**********
     * STRINGS
     **********/
    
    // Soldiers String
    static let kSoldiersString = "Soldiers"
    
    // Leave the battle String
    static let kLeaveTheBattleString = "Leave the battle"
    
    // Do you want to leave the battle String
    static let kDoYouWantToLeaveTheBattleString = "Do you really want to cowardly leave the battle? 😑"
    
    // Attack the Door String
    static let kAttackTheDoorString = "Attack the Door!"
    
    // Attack String
    static let kAttackString = "Attack!"
    
    // Is attacking String
    static let kIsAttacking = "is attacking!"
    
    // It's your turn, attack the Door String
    static let kItsYourTurnAttackTheDoorString = "It's your turn. Attack the Door!"
    
    // Leave Fight String
    static let kLeaveFightString = "Leave the fight?"
    
    // Leave String
    static let kLeaveString = "Leave"
    
    // Add String
    static let kAddString = "Add"
    
    // Error String
    static let kErrorString = "Error"
    
    // Door String
    static let kDoorString = "Door"
    
    // Delete this soldier String
    static let kDeleteThisSoldierString = "Delete this soldier"
    
    // What to do with this soldier String
    static let kWhatToDoWithSoldier = "What do you want to do with this soldier?"
    
    // You win String
    static let kWinString = "You win!"
    
    // You lose String
    static let kLoseString = "You lose!"
    
    // Win message String
    static let kWinMessageString = "The Princess is saved, Congratulations! 😁"
    
    // Lose message String
    static let kLoseMessageString = "Try again! The Princess doesn't want to stay with Bowser 😉"
    
    // Confirm String
    static let kConfirmString = "Confirm"

    // Yes String
    static let kYesString = "Yes"
    
    // No String
    static let kNoString = "No"
    
    // Back String
    static let kBackString = "Back"
    
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
    
    // Get ready String
    static let kGetReadyString = "Get Ready!"
    
    // Soldier type names
    static let kSoldierTypeNames = ["Male",
                                    "Female",
                                    "Other"]
    
    // Soldier gender associated symbols
    static let kSoldierAssociatedSymbols = ["♂",
                                            "♀",
                                            "?"]
    
    /**********
     * COLORS
     **********/
    
    // Application blue tint color - main
    static let kApplicationBlueTintColor = UIColor(hexString: "07BDF7")
    
    // Application darker text color
    static let kApplicationDarkerTextColor = UIColor(hexString: "121212")
    
    // Application fighter HP card background color
    static let kFighterHPCardBackgroundColor = UIColor(hexString: "F6EBD5")
    
    // Application darker blue gradient
    static let kApplicationDarkerBlueGradientColors: [CGColor] = [UIColor.blue.cgColor,
                                                                  UIColor.black.cgColor]
    
    static let kApplicationFightBackgroundGradientColors: [CGColor] = [(UIColor(hexString: "7A5B41")?.cgColor)!,
                                                                       (UIColor(hexString: "ECC19C")?.cgColor)!,
                                                                       (UIColor(hexString: "F4CEAC")?.cgColor)!,
                                                                       (UIColor(hexString: "ECC19C")?.cgColor)!,
                                                                       (UIColor(hexString: "7A5B41")?.cgColor)!]
    
    // Soldier gender associated symbols colors
    static let kSoldierAssociatedSymbolsColors: [UIColor] = [UIColor.blue,
                                                             UIColor(hexString: "FF69B4")!, // Pink
                                                             UIColor.darkGray]
    
    /**********
     * FONTS
     **********/

    // Application title font
    static let kApplicationTitleFont = UIFont.boldSystemFont(ofSize: 22.0)
    
    // Application button font
    static let kApplicationButtonFont = UIFont.boldSystemFont(ofSize: 18.0)
    
    // Bigger standard font
    static let kApplicationBiggerStandardFont = UIFont.systemFont(ofSize: 16.0)
    
    // Semibold bigger header font
    static let kSemiboldBiggerHeaderFont = UIFont.systemFont(ofSize: 15.0, weight: UIFontWeightSemibold)
    
    // Standard font
    static let kApplicationStandardFont = UIFont.systemFont(ofSize: 14.0)
    
    // Semibold header font
    static let kSemiboldHeaderFont = UIFont.systemFont(ofSize: 13.0, weight: UIFontWeightSemibold)
    
    // Small font
    static let kApplicationSmallFont = UIFont.systemFont(ofSize: 12.0, weight: UIFontWeightThin)
}
