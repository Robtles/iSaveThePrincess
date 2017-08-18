//
//  STPRealmHelper.swift
//  iSaveThePrincess
//
//  Created by Robin on 19/08/2017.
//  Copyright © 2017 Rob. All rights reserved.
//

import RealmSwift

// MARK: - STPRealmHelper
public final class STPRealmHelper {
    
    // Realm instance
    let realm = try! Realm()
    
    // Singleton shared instance
    static let shared = STPRealmHelper()
    
    // List of soldiers in Realm
    lazy var storedSoldiers: Results<STPManagedSoldier> = { self.realm.objects(STPManagedSoldier.self) }()
    
    // Write function
    public func write(_ block: (STPWriteTransaction) throws -> Void) throws {
        let transaction = STPWriteTransaction()
        try realm.write {
            try block(transaction)
        }
    }
}

public final class STPWriteTransaction {
    public func add<T: STPPersistable>(_ value: T, update: Bool) {
        STPRealmHelper.shared.realm.add(value.managedObject(), update: update)
    }
    
    public func remove<T: STPPersistable>(_ value: T) {
        STPRealmHelper.shared.realm.delete(value.managedObject())
    }
}

// MARK: - STPPersistable protocol
public protocol STPPersistable {
    associatedtype ManagedObject: RealmSwift.Object
    init(managedObject: ManagedObject)
    func managedObject() -> ManagedObject
}

// MARK: - Realm operations on soldiers
extension STPRealmHelper {
    
    /**
     Add or update a soldier into Realm
     @param soldier The soldier
     @param updating True if updating soldier, false if creating new
     @return If Realm transaction was successful
     */
    func addOrUpdateSoldier(_ soldier: STPSoldier, updating: Bool) -> Bool {
        
        do {
            try STPRealmHelper.shared.write({ (transaction) in
                transaction.add(soldier, update: updating)
            })
            return true
        } catch {
            return false
        }
    }
    
    /**
     Remove a soldier from Realm
     @param soldier The soldier
     @return If Realm transaction was successful
     */
    func removeSoldier(_ soldier: STPSoldier) -> Bool {
        
        do {
            try STPRealmHelper.shared.write({ (transaction) in
                transaction.remove(soldier)
            })
            return true
        } catch {
            return false
        }
    }
}
