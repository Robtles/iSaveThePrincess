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
    @IBOutlet weak var barButtonItem: UIBarButtonItem!
    @IBOutlet weak var getReadyView: STPGetReadyView!
    
    var selectedSoldier: STPSoldier?
    
    // MARK: - Application lifecycle
    override func viewDidLoad() {
        
        self.title = Constants.kSoldiersString
        
        // Gradient view
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = Constants.kApplicationDarkerBlueGradientColors
        self.view.layer.insertSublayer(gradient, at: 0)
        
        self.barButtonItem.title = Constants.kAddString
        self.barButtonItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for: .normal)
        
        self.getReadyView.isHidden = true
        self.getReadyView.alpha = 0.0
    }
    
    // MARK: - Actions
    @IBAction func addButtonTapped(_ sender: Any) {
        STPAddOrUpdateSoldierModalViewController.presentIn(self, delegate: self)
    }
    
    fileprivate func showAlertWith(_ soldier: STPSoldier) {
        
        let appearance: SCLAlertView.SCLAppearance = SCLAlertView.SCLAppearance(kDefaultShadowOpacity: 0.5,
                                                                                kTitleFont: Constants.kApplicationTitleFont,
                                                                                kTextFont: Constants.kApplicationStandardFont,
                                                                                kButtonFont: Constants.kApplicationButtonFont,
                                                                                hideWhenBackgroundViewIsTapped: true)
        let alert = SCLAlertView(appearance: appearance)

        alert.addButton(Constants.kAttackTheDoorString,
                        backgroundColor: Constants.kApplicationBlueTintColor,
                        textColor: UIColor.white) {
                            
                            self.prepareFight(withSoldier: soldier)
        }
        
        alert.addButton(Constants.kUpdateString,
                        backgroundColor: Constants.kApplicationBlueTintColor,
                        textColor: UIColor.white) {
                            
                            STPAddOrUpdateSoldierModalViewController.presentIn(self,
                                                                               delegate: self,
                                                                               updatingSoldier: soldier)
        }
        
        alert.addButton(Constants.kDeleteString,
                        backgroundColor: Constants.kApplicationBlueTintColor,
                        textColor: UIColor.white) {
                            
                            if STPRealmHelper.shared.removeSoldier(soldier.index) {
                                
                                DispatchQueue.main.async {
                                    self.soldiersCollectionView.reloadData()
                                }
                            } else {
                                
                                Utils.showErrorAlert(withMessage: Constants.kErrorString,
                                                     title: Constants.kCouldNotDeleteSoldierString)
                            }
        }
        
        alert.showInfo(soldier.name,
                       subTitle: Constants.kWhatToDoWithSoldier,
                       closeButtonTitle: Constants.kBackString,
                       colorStyle: 0x07BDF7)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Constants.kToBattleScreenSegue {
            
            let destination = segue.destination as! STPFightViewController
            destination.battleManager = STPBattleManager(withSoldier: self.selectedSoldier!)
        }
    }
    
    private func prepareFight(withSoldier soldier: STPSoldier) {
        
        self.selectedSoldier = soldier
        self.getReadyView.isHidden = false
        self.getReadyView.alpha = 0.3
        
        UIView.animate(withDuration: 2.0, animations: {
            self.getReadyView.alpha = 1.0
        }) { result in
            self.getReadyView.alpha = 0.0
            self.getReadyView.isHidden = true
            self.performSegue(withIdentifier: Constants.kToBattleScreenSegue, sender: self)
        }
    }
}

// MARK: - Collection View Delegate
extension STPSoldierCollectionViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        let soldier = STPSoldier(managedObject: STPRealmHelper.shared.storedSoldiers[indexPath.row])
        self.showAlertWith(soldier)
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
        
        return CGFloat.leastNormalMagnitude
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return CGFloat.leastNormalMagnitude
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsetsMake(CGFloat.leastNormalMagnitude,
                                CGFloat.leastNormalMagnitude,
                                CGFloat.leastNormalMagnitude,
                                CGFloat.leastNormalMagnitude)
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
        cell.soldierGenderLabel.text = soldier.gender.associatedSymbolString
        cell.soldierGenderLabel.textColor = soldier.gender.associatedSymbolColor
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
