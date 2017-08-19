//
//  STPSoldierCollectionViewCell.swift
//  iSaveThePrincess
//
//  Created by Robin on 19/08/2017.
//  Copyright © 2017 Rob. All rights reserved.
//

import UIKit

class STPSoldierCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var soldierAgeLabel: UILabel!
    @IBOutlet weak var soldierImageView: UIImageView!
    @IBOutlet weak var soldierNameLabel: UILabel!
    
    // - MARK: Application lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.soldierAgeLabel.font = Constants.kApplicationTitleFont
        self.soldierAgeLabel.textColor = UIColor.darkGray
        
        self.soldierNameLabel.font = Constants.kApplicationStandardFont
        self.soldierNameLabel.textColor = Constants.kApplicationDarkerTextColor
    }
}
