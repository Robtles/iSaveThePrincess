//
//  STPGetReadyView.swift
//  iSaveThePrincess
//
//  Created by Robin on 19/08/2017.
//  Copyright © 2017 Rob. All rights reserved.
//

import UIKit

class STPGetReadyView: UIView {
    
    @IBOutlet weak var getReadyLabel: UILabel!
    
    // - MARK: Application lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.getReadyLabel.text = Constants.kGetReadyString
        self.getReadyLabel.font = Constants.kApplicationTitleFont
        self.getReadyLabel.textColor = UIColor.white
        
        self.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        self.setCornerRadius(radius: 8.0)
    }
}
