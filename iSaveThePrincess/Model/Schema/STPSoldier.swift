//
//  STPSoldier.swift
//  iSaveThePrincess
//
//  Created by Robin on 19/08/2017.
//  Copyright © 2017 Rob. All rights reserved.
//

import UIKit

enum STPSoldierGenderEnum: Int {
    
    case male = 0
    case female
    case other
    
    // The associated sprite image
    var associatedSpriteImage: UIImage {
        switch self {
        case .male:
            return UIImage(named: "male")!
        case .female:
            return UIImage(named: "female")!
        case .other:
            return UIImage(named: "other")!
        }
    }
    
    // The name (male, female or other)
    var name: String {
        return Constants.kSoldierTypeNames[self.rawValue]
    }
}

// MARK: - Soldier model
struct STPSoldier {
    
    // Soldier name
    var name: String = ""
    //  Soldier color (will be formatted in hex, like #FFFFFF)
    var color: String = "FFFFFF"
    // Soldier gender (male, female or other)
    var gender: STPSoldierGenderEnum = .male
    // Soldier age
    var age: Int = 20
}
