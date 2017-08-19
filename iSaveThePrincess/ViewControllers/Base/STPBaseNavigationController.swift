//
//  STPBaseNavigationController.swift
//  iSaveThePrincess
//
//  Created by Robin on 19/08/2017.
//  Copyright © 2017 Rob. All rights reserved.
//

import UIKit

class STPBaseNavigationController: UINavigationController {
    
    // MARK: - Initializer
    required init?(coder aDecoder: NSCoder) {
     
        super.init(coder: aDecoder)
        
        self.navigationBar.isTranslucent = false
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        self.navigationBar.barTintColor = Constants.kApplicationBlueTintColor
        self.navigationBar.tintColor = UIColor.white
    }
}
