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
    
    let soldier: STPSoldierInBattle!
    let door: STPDoor!
    
    init(withSoldier soldier: STPSoldier) {
        self.soldier = STPSoldierInBattle(withSoldier: soldier)
        self.door = STPDoor()
    }
}
