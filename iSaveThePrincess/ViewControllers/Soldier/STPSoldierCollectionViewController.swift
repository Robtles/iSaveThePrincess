//
//  STPSoldierCollectionViewController.swift
//  iSaveThePrincess
//
//  Created by Robin on 19/08/2017.
//  Copyright © 2017 Rob. All rights reserved.
//

import UIKit
import SCLAlertView

class STPSoldierCollectionViewController: UIViewController {
    
    @IBOutlet weak var soldiersCollectionView: UICollectionView!
    @IBOutlet weak var attackDoorButton: UIButton!
    @IBOutlet weak var barButtonItem: UIBarButtonItem!
    
    // MARK: - Application lifecycle
    override func viewDidLoad() {
        
        self.title = Constants.kSoldiersString
        
        // Gradient view
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = Constants.kApplicationDarkerBlueGradientColors
        self.view.layer.insertSublayer(gradient, at: 0)
        
        self.attackDoorButton.createSTPBlueButton(withTitle: Constants.kAttackTheDoorString)
        
        self.barButtonItem.title = Constants.kAddString
        self.barButtonItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for: .normal)
    }
    
    // MARK: - Actions
    @IBAction func addButtonTapped(_ sender: Any) {
        STPAddOrUpdateSoldierModalViewController.presentIn(self, delegate: self)
    }
    
    @IBAction func attackTheDoorButtonTapped(_ sender: Any) {
        
        guard STPRealmHelper.shared.storedSoldiers.count > 0 else {
            
            Utils.showErrorAlert(withMessage: Constants.kNoSoldierErrorMessageString)
            return
        }
        
        
    }
}

// MARK: - Collection View Delegate
extension STPSoldierCollectionViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let soldier = STPSoldier(managedObject: STPRealmHelper.shared.storedSoldiers[indexPath.row])
        
        STPAddOrUpdateSoldierModalViewController.presentIn(self,
                                                           delegate: self,
                                                           updatingSoldier: soldier)
    }
}

// MARK: - Collection View Delegate Flow Layout
extension STPSoldierCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.size.width / 3, height: 158)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
    }
}

// MARK: - Collection View Data Source
extension STPSoldierCollectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        guard STPRealmHelper.shared.storedSoldiers.count > 0 else {
            
            let noSoldiersLabel = UILabel(frame: collectionView.bounds)
            noSoldiersLabel.text = Constants.kNoSoldiersLabelString
            noSoldiersLabel.font = Constants.kApplicationStandardFont
            noSoldiersLabel.textColor = UIColor.darkGray
            noSoldiersLabel.textAlignment = .center
            collectionView.backgroundView = noSoldiersLabel
            
            return 0
        }
        
        collectionView.backgroundView = nil
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return STPRealmHelper.shared.storedSoldiers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "soldierCell", for: indexPath) as! STPSoldierCollectionViewCell
        
        let soldier = STPSoldier(managedObject: STPRealmHelper.shared.storedSoldiers[indexPath.row])

        cell.soldierAgeLabel.text = "\(soldier.age)"
        cell.soldierImageView.image = soldier.gender.associatedSpriteImage
            .tinted(color: UIColor(hexString: soldier.color)!)
        cell.soldierNameLabel.text = soldier.name
        
        return cell
    }
}

// MARK: - Add or update Soldier Delegate
extension STPSoldierCollectionViewController: STPAddOrUpdateSoldierDelegate {
    
    func didUpdateSoldiersList() {
        DispatchQueue.main.async {
            self.soldiersCollectionView.reloadData()
        }
    }
}
