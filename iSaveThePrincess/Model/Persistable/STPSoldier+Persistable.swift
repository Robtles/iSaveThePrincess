//
//  STPSoldier+Persistable.swift
//  iSaveThePrincess
//
//  Created by Robin on 19/08/2017.
//  Copyright © 2017 Rob. All rights reserved.
//

extension STPSoldier: STPPersistable {
    
    // MARK: - Initializer
    // Init model from Realm object
    init(managedObject: STPManagedSoldier) {
        
        self.name = managedObject.name
        self.color = managedObject.color
        self.gender = STPSoldierGenderEnum(rawValue: managedObject.gender)!
        self.age = managedObject.age
    }
    
    // Persist current object into Realm
    func managedObject() -> STPManagedSoldier {
        
        let managedSoldier = STPManagedSoldier()
        
        managedSoldier.name = self.name
        managedSoldier.color = self.color
        managedSoldier.gender = self.gender.rawValue
        managedSoldier.age = self.age
        
        return managedSoldier
    }

}
