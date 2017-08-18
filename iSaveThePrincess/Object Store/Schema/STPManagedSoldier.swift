//
//  STPManagedSoldier.swift
//  iSaveThePrincess
//
//  Created by Robin on 19/08/2017.
//  Copyright © 2017 Rob. All rights reserved.
//

import RealmSwift

// MARK: - Realm Managed Soldier
class STPManagedSoldier: Object {

    dynamic var name: String = ""
    dynamic var color: String = "FFFFFF"
    dynamic var gender: Int = STPSoldierGenderEnum.male.rawValue
    dynamic var age: Int = 20
}
