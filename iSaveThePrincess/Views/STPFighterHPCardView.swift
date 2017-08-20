//
//  STPFighterHPCardView.swift
//  iSaveThePrincess
//
//  Created by Robin on 20/08/2017.
//  Copyright © 2017 Rob. All rights reserved.
//

import UIKit

// A card displayed while battling showing 
// fighter information and remaining HP
class STPFighterHPCardView: UIView {
    
    @IBOutlet weak var fighterNameLabel: UILabel!
    @IBOutlet weak var hpBorderBarView: UIView!
    @IBOutlet weak var hpRemainingBarView: UIView!
    @IBOutlet weak var hpRemovedBarView: UIView!
    @IBOutlet weak var currentHPAmountLabel: UILabel!
    
    // MARK: - Application lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()

        self.fighterNameLabel.font = Constants.kSemiboldBiggerHeaderFont
        self.fighterNameLabel.textColor = UIColor.brown
        self.fighterNameLabel.adjustsFontSizeToFitWidth = true
        
        self.hpBorderBarView.backgroundColor = UIColor.black
        self.hpBorderBarView.setCornerRadius(radius: 2.0)
        
        self.hpRemainingBarView.backgroundColor = UIColor.green
        
        self.hpRemovedBarView.backgroundColor = UIColor.black
        
        self.currentHPAmountLabel.font = Constants.kApplicationTitleFont
        self.currentHPAmountLabel.textColor = UIColor.darkGray
        
        self.backgroundColor = Constants.kFighterHPCardBackgroundColor
        self.setCornerRadius(radius: 8.0)
    }
    
    // MARK: - Helpers
    func setupCard(_ fighterName: String, hpAmount: Int) {
        self.fighterNameLabel.text = fighterName.uppercased()
        self.currentHPAmountLabel.text = "HP: \(hpAmount)"
    }
}
