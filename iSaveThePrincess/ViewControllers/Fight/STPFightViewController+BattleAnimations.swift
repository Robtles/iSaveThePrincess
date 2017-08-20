//
//  STPFightViewController+BattleAnimations.swift
//  iSaveThePrincess
//
//  Created by Robin on 20/08/2017.
//  Copyright © 2017 Rob. All rights reserved.
//

import UIKit

private enum STPFightAttackerEnum {
    case soldier
    case door
}

// Isolating the animations here since I am 
// not a huge fan of massive view controllers.
extension STPFightViewController {
    
    // MARK: - Animation helpers
    
    // MARK: - Fighters
    
    // Animating an attack. Works for both the soldier
    // and the door, hence the bool parameter
    func animateAttack(fromSoldier: Bool,
                       lostPoints: Int,
                       _ completion: @escaping () -> Void) {
        
        self.attackButton.isHidden = true
        
        let attacker: STPFightAttackerEnum = (fromSoldier) ? .soldier : .door
        let defender: STPFightAttackerEnum = (fromSoldier) ? .door : .soldier
        
        let attackerName: String = (attacker == .soldier) ? (self.battleManager?.soldier.name)! : Constants.kDoorString
        let defenderName: String = (attacker == .soldier) ? Constants.kDoorString : (self.battleManager?.soldier.name)!
        
        self.changeInformationText("\(attackerName) \(Constants.kIsAttacking)")
        
        let initialCoordinates: CGPoint = (fromSoldier) ?
            CGPoint(x: self.soldierHorizontalConstraint.constant, y: self.soldierVerticalConstraint.constant) :
            CGPoint(x: self.doorHorizontalConstraint.constant, y: self.doorVerticalConstraint.constant)
        
        self.movingBack(attacker) {
            
            self.attackMove(attacker) {
                
                self.updateHPBar(of: defender)
                self.changeInformationText("\(defenderName) loses \(lostPoints) HP!")
                self.blinkingAnimation(attacker)
                self.comebackFromAttack(attacker,
                                        toCoordinates: initialCoordinates) {
                    
                    completion()
                }
            }
        }
    }
    
    // Blinking animation of defender receiving an attack
    private func blinkingAnimation(_ attacker: STPFightAttackerEnum) {
        let viewToBlink: UIImageView! = (attacker == .soldier) ? self.doorImageView : self.soldierImageView
        viewToBlink.blinkView(2)
    }
    
    // The back move of the attacker just before the attack
    private func movingBack(_ attacker: STPFightAttackerEnum,
                            _ completion: @escaping () -> Void) {
        
        switch attacker {
        case .soldier:
            self.soldierVerticalConstraint.constant -= 10
            self.soldierHorizontalConstraint.constant -= 10
        case .door:
            self.doorVerticalConstraint.constant -= 10
            self.doorHorizontalConstraint.constant -= 10
        }
        
        UIView.animate(withDuration: 0.6,
                       animations: { 
                        self.view.layoutIfNeeded()
        }) { result in
            completion()
        }
    }
    
    // The attack move
    private func attackMove(_ attacker: STPFightAttackerEnum,
                            _ completion: @escaping () -> Void) {
        
        switch attacker {
        case .soldier:
            self.soldierVerticalConstraint.constant += (self.soldierImageView.center.x - self.doorImageView.center.x) / 2
            self.soldierHorizontalConstraint.constant -= (self.soldierImageView.center.y - self.doorImageView.center.y) / 2
        case .door:
            self.doorVerticalConstraint.constant += (self.soldierImageView.center.x - self.doorImageView.center.x) / 2
            self.doorHorizontalConstraint.constant -= (self.soldierImageView.center.y - self.doorImageView.center.y) / 2
        }
        
        UIView.animate(withDuration: 0.25,
                       animations: {
                        self.view.layoutIfNeeded()
        }) { result in
            completion()
        }
    }
    
    // The comeback move after the attack
    private func comebackFromAttack(_ attacker: STPFightAttackerEnum,
                                    toCoordinates: CGPoint,
                                    _ completion: @escaping () -> Void) {
        
        switch attacker {
        case .soldier:
            self.soldierVerticalConstraint.constant = toCoordinates.y
            self.soldierHorizontalConstraint.constant = toCoordinates.x
        case .door:
            self.doorVerticalConstraint.constant = toCoordinates.y
            self.doorHorizontalConstraint.constant = toCoordinates.x
        }
        
        UIView.animate(withDuration: 0.6,
                       delay: 0.15,
                       animations: {
                        self.view.layoutIfNeeded()
        }) { result in
            completion()
        }
    }
    
    // MARK: - Information views
    private func changeInformationText(_ string: String) {
        self.battleInformationLabel.text = string
    }
    
    private func updateHPBar(of defender: STPFightAttackerEnum) {
        
        var newBlackBarWidth: CGFloat = 0.0
        let constantToUpdate = (defender == .soldier) ? self.soldierRemovedBarViewWidth : self.doorRemovedBarViewWidth
        
        switch defender {
        case .soldier:
            let age: CGFloat! = CGFloat((self.battleManager?.soldier.age)!)
            let remainingHP: CGFloat! = CGFloat((self.battleManager?.soldier.hp)!)
            newBlackBarWidth = ((age - remainingHP) / age) * Constants.kHPBarWidth
        case .door:
            let durability: Int! = self.battleManager?.door.durability
            newBlackBarWidth = ((Constants.kDoorDurability - CGFloat(durability)) / Constants.kDoorDurability) * Constants.kHPBarWidth
        }
        
        let previousValue: CGFloat! = constantToUpdate?.constant
        constantToUpdate?.constant = CGFloat(newBlackBarWidth)
        let duration: TimeInterval = TimeInterval(0.015 * (newBlackBarWidth - previousValue))
        
        UIView.animate(withDuration: duration,
                       animations: {
                        
                        if defender == .soldier {
                            self.soldierCardView.hpBorderBarView.layoutIfNeeded()
                        } else {
                            self.doorCardView.hpBorderBarView.layoutIfNeeded()
                        }
                        
        }) { result in
            
            if defender == .soldier {
                self.soldierCardView.updateHPAmountLabel((self.battleManager?.soldier.hp)!)
                let hpFloat: CGFloat = CGFloat((self.battleManager?.soldier.hp)!)
                let ageFloat: CGFloat = CGFloat((self.battleManager?.soldier.age)!)
                self.soldierCardView.updateHPBarColor(hpFloat / ageFloat)
            } else {
                self.doorCardView.updateHPAmountLabel((self.battleManager?.door.durability)!)
                self.doorCardView.updateHPBarColor(CGFloat((self.battleManager?.door.durability)!) / Constants.kDoorDurability)
            }
        }
    }
}
