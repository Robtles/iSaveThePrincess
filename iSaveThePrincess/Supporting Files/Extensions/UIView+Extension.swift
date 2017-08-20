//
//  UIView+Extension.swift
//  iSaveThePrincess
//
//  Created by Robin on 20/08/2017.
//  Copyright © 2017 Rob. All rights reserved.
//

import UIKit

extension UIView {
    
    // MARK: - Helpers
    // Helper method to blink a UIView (x times + 1)
    func blinkView(_ times: Int) {
        
        Utils.delay(0.1) {
            self.alpha = 0.0
            
            Utils.delay(0.1) {
                self.alpha = 1.0
                
                if times > 0 {
                    self.blinkView(times - 1)
                }
            }
        }
    }
}

