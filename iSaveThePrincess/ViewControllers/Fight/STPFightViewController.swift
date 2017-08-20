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
    
    // Constraints needed for animations
    @IBOutlet weak var soldierVerticalConstraint: NSLayoutConstraint!
    @IBOutlet weak var soldierHorizontalConstraint: NSLayoutConstraint!
    @IBOutlet weak var doorVerticalConstraint: NSLayoutConstraint!
    @IBOutlet weak var doorHorizontalConstraint: NSLayoutConstraint!
    @IBOutlet weak var soldierRemovedBarViewWidth: NSLayoutConstraint!
    @IBOutlet weak var doorRemovedBarViewWidth: NSLayoutConstraint!
    
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
        
        self.attack(fromSoldier: true) {
            
            if self.battleManager!.doorIsKO() {
                self.showEndBattleAlert(Constants.kWinString, message: Constants.kWinMessageString)
            } else {
                
                // CPU door attacks!
                Utils.delay(1.0, completion: {
                    
                    self.attack(fromSoldier: false) {
                        
                        if self.battleManager!.soldierIsKO() {
                            self.showEndBattleAlert(Constants.kLoseString, message: Constants.kLoseMessageString)
                        } else {
                            self.attackButton.isHidden = false
                        }
                    }
                })
            }
        }
    }
    
    private func attack(fromSoldier: Bool,
                        _ completion: @escaping () -> Void) {
        
        let lostPoints: Int! = self.battleManager?.attack(fromSoldier: fromSoldier)
        self.animateAttack(fromSoldier: fromSoldier, lostPoints: lostPoints) {
            
            completion()
        }
    }
    
    private func showEndBattleAlert(_ title: String,
                                    message: String) {
        
        self.view.isUserInteractionEnabled = false
        
        let appearance: SCLAlertView.SCLAppearance = SCLAlertView.SCLAppearance(kDefaultShadowOpacity: 0.5,
                                                                                kTitleFont: Constants.kApplicationTitleFont,
                                                                                kTextFont: Constants.kApplicationStandardFont,
                                                                                kButtonFont: Constants.kApplicationButtonFont,
                                                                                hideWhenBackgroundViewIsTapped: false)
        let alert = SCLAlertView(appearance: appearance)
        
        alert.showInfo(title,
                       subTitle: message,
                       closeButtonTitle: Constants.kBackString,
                       colorStyle: 0x07BDF7)
            .setDismissBlock {
                
            self.dismiss(animated: true, completion: nil)
        }
    }
}
