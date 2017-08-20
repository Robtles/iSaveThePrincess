//
//  STPSoldierInBattle.swift
//  iSaveThePrincess
//
//  Created by Robin on 20/08/2017.
//  Copyright © 2017 Rob. All rights reserved.
//

// MARK: - Soldier in Battle model
struct STPSoldierInBattle: STPSoldierProtocol {

    // Soldier name
    var name: String = ""
    //  Soldier color (will be formatted in hex, like #0000FF)
    var color: String = "FF0000"
    // Soldier gender (male, female or other)
    var gender: STPSoldierGenderEnum = .male
    // Soldier age
    var age: Int = 20
    // Soldier HP remaining count
    var hp: Int = 20
    
    init(withSoldier soldier: STPSoldier) {
        
        self.name = soldier.name
        self.color = soldier.color
        self.gender = soldier.gender
        self.age = soldier.age
        self.hp = self.age
    }
}
