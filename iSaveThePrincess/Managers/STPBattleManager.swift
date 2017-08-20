//
//  STPBattleManager.swift
//  iSaveThePrincess
//
//  Created by Robin on 20/08/2017.
//  Copyright © 2017 Rob. All rights reserved.
//

import Foundation

// MARK: - Battle Manager
// The battle manager with the soldier and the door.
struct STPBattleManager {
    
    var soldier: STPSoldierInBattle!
    var door: STPDoor!
    
    // MARK: - Initializers
    init(withSoldier soldier: STPSoldier) {
        self.soldier = STPSoldierInBattle(withSoldier: soldier)
        self.door = STPDoor()
    }
    
    // MARK: - Helpers
    // Attack, returning lost points
    mutating func attack(fromSoldier: Bool) -> Int! {
        
        // Soldier attacking
        if fromSoldier {
            
            // If door has less durability points than soldier age, falls to 0
            guard self.door.durability >= self.soldier.age else {
                let pointsToReturn = self.door.durability
                self.door.durability = 0
                return pointsToReturn
            }
            
            // Else door loses soldier.age points of durability
            self.door.durability -= self.soldier.age
            return self.soldier.age
        }
        
        // Door attacking. Soldier loses random(1;age) points
        let lostPoints = Int.random(within: 1..<(self.soldier.age+1))
        
        // If soldier has less HP than door's attack damage, falls to 0
        guard self.soldier.hp >= lostPoints else {
            let pointsToReturn = self.soldier.hp
            self.soldier.hp = 0
            return pointsToReturn
        }

        self.soldier.hp -= lostPoints
        return lostPoints
    }
    
    func soldierIsKO() -> Bool! {
        return self.soldier.hp <= 0
    }
    
    func doorIsKO() -> Bool! {
        return self.door.durability <= 0
    }
}
