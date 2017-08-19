//
//  STPSoldierCollectionViewController.swift
//  iSaveThePrincess
//
//  Created by Robin on 19/08/2017.
//  Copyright © 2017 Rob. All rights reserved.
//

import UIKit

class STPSoldierCollectionViewController: UIViewController {
    
    @IBOutlet weak var soldiersCollectionView: UICollectionView!
    @IBOutlet weak var attackDoorButton: UIButton!
    
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
    }
}
