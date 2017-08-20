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
    
    // The associated symbol string
    var associatedSymbolString: String {
        return Constants.kSoldierAssociatedSymbols[self.rawValue]
    }
    
    // The associated symbol color
    var associatedSymbolColor: UIColor {
        return Constants.kSoldierAssociatedSymbolsColors[self.rawValue]
    }
    
    // The name (male, female or other)
    var name: String {
        return Constants.kSoldierTypeNames[self.rawValue]
    }
}

// MARK: - Soldier model
struct STPSoldier: STPSoldierProtocol {
    
    // Soldier index
    var index: Int = 0
    // Soldier name
    var name: String = ""
    //  Soldier color (will be formatted in hex, like #0000FF)
    var color: String = "FF0000"
    // Soldier gender (male, female or other)
    var gender: STPSoldierGenderEnum = .male
    // Soldier age
    var age: Int = 20
}

protocol STPSoldierProtocol {
    
    var name: String { get set }
    var color: String { get set }
    var gender: STPSoldierGenderEnum { get set }
    var age: Int { get set }
}
