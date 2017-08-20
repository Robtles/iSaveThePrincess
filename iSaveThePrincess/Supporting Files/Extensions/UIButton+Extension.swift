//
//  UIButton+Extension.swift
//  iSaveThePrincess
//
//  Created by Robin on 19/08/2017.
//  Copyright © 2017 Rob. All rights reserved.
//

import UIKit

extension UIButton {
    
    // Helper function to create a blue button with a given title and a 8px corner radius
    open func createSTPButton(withTitle title: String,
                              andColor color: UIColor = Constants.kApplicationBlueTintColor!) {
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = Constants.kApplicationButtonFont
        self.backgroundColor = color
        self.setCornerRadius(radius: 8.0)
    }
}
