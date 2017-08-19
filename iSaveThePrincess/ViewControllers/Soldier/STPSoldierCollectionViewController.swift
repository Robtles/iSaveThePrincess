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
        
        self.attackDoorButton.setTitle(Constants.kAttackTheDoorString, for: .normal)
        self.attackDoorButton.setTitleColor(UIColor.white, for: .normal)
        self.attackDoorButton.titleLabel?.font = Constants.kApplicationButtonFont
        self.attackDoorButton.backgroundColor = Constants.kApplicationBlueTintColor
        self.attackDoorButton.setCornerRadius(radius: 8.0)
        
        self.barButtonItem.title = Constants.kAddString
        self.barButtonItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for: .normal)
    }
    
    // MARK: - Actions
    @IBAction func addButtonTapped(_ sender: Any) {
        
        
    }
    
    @IBAction func attackTheDoorButtonTapped(_ sender: Any) {
        
        guard STPRealmHelper.shared.storedSoldiers.count > 0 else {
            
            let appearance: SCLAlertView.SCLAppearance = SCLAlertView.SCLAppearance(kDefaultShadowOpacity: 0.5,
                                                                                    kTitleFont: Constants.kApplicationTitleFont,
                                                                                    kTextFont: Constants.kApplicationStandardFont,
                                                                                    kButtonFont: Constants.kApplicationButtonFont,
                                                                                    hideWhenBackgroundViewIsTapped: true)
            let alert = SCLAlertView(appearance: appearance)
            
            alert.showError(Constants.kErrorString,
                            subTitle: Constants.kNoSoldierErrorMessage,
                            closeButtonTitle: Constants.kOkString.uppercased())
            
            return
        }
    }
}

// MARK: - Collection View Delegate
extension STPSoldierCollectionViewController: UICollectionViewDelegate {
    
    
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
        return UICollectionViewCell()
    }
}
