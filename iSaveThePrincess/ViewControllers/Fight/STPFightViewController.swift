//
//  STPFightViewController.swift
//  iSaveThePrincess
//
//  Created by Robin on 19/08/2017.
//  Copyright © 2017 Rob. All rights reserved.
//

import UIKit
import SCLAlertView

class STPFightViewController: UIViewController {
    
    var battleManager: STPBattleManager?
    
    @IBOutlet weak var soldierImageView: UIImageView!
    @IBOutlet weak var doorImageView: UIImageView!
    @IBOutlet weak var battleInformationView: UIView!
    @IBOutlet weak var battleInformationLabel: UILabel!
    @IBOutlet weak var leaveFightButton: UIButton!
    @IBOutlet weak var attackButton: UIButton!
    
    @IBOutlet weak var soldierCardView: STPFighterHPCardView!
    @IBOutlet weak var doorCardView: STPFighterHPCardView!
    
    // MARK: - Application lifecycle
    override func viewDidLoad() {
        
        self.soldierImageView.image = self.battleManager?.soldier.gender.associatedSpriteImage
            .tinted(color: UIColor(hexString: (self.battleManager?.soldier.color)!)!)
        
        self.doorImageView.image = UIImage(named: "door")
        
        self.battleInformationView.addBorder(width: 4.0, color: UIColor.brown)
        self.battleInformationView.setCornerRadius(radius: 8.0)
        
        self.battleInformationLabel.font = Constants.kApplicationBiggerStandardFont
        self.battleInformationLabel.textColor = UIColor.darkGray
        self.battleInformationLabel.text = Constants.kItsYourTurnAttackTheDoorString
        self.battleInformationLabel.textAlignment = .center
        
        self.leaveFightButton.createSTPButton(withTitle: Constants.kLeaveString)
        
        self.attackButton.createSTPButton(withTitle: Constants.kAttackString, andColor: UIColor.brown)

        self.soldierCardView.setupCard((self.battleManager?.soldier.name)!, hpAmount: (self.battleManager?.soldier.hp)!)
        self.doorCardView.setupCard(Constants.kDoorString, hpAmount: (self.battleManager?.door.durability)!)
    }
    
    // MARK: - Actions
    @IBAction func leaveButtonTapped(_ sender: Any) {
    
        let appearance: SCLAlertView.SCLAppearance = SCLAlertView.SCLAppearance(kDefaultShadowOpacity: 0.5,
                                                                                kTitleFont: Constants.kApplicationTitleFont,
                                                                                kTextFont: Constants.kApplicationStandardFont,
                                                                                kButtonFont: Constants.kApplicationButtonFont,
                                                                                hideWhenBackgroundViewIsTapped: true)
        let alert = SCLAlertView(appearance: appearance)
        
        alert.addButton(Constants.kYesString,
                        backgroundColor: Constants.kApplicationBlueTintColor,
                        textColor: UIColor.white) {
                            
                            self.dismiss(animated: true, completion: nil)
        }
        
        alert.showInfo(Constants.kLeaveTheBattleString,
                       subTitle: Constants.kDoYouWantToLeaveTheBattleString,
                       closeButtonTitle: Constants.kNoString,
                       colorStyle: 0x07BDF7)
    }
    
    @IBAction func attackButtonTapped(_ sender: Any) {
    
    }
}
