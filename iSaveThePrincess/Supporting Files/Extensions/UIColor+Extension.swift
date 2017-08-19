//
//  UIColor+Extension.swift
//  iSaveThePrincess
//
//  Created by Robin on 19/08/2017.
//  Copyright © 2017 Rob. All rights reserved.
//

import UIKit

extension UIColor {
    
    // EZSwiftExtensions is great but doesn't provide a function to 
    // get the hexString of a given UIColor :( So here it is.
    var hexString: String {
        
        let colorRef = self.cgColor.components!
        
        let r:CGFloat = colorRef[0]
        let g:CGFloat = colorRef[1]
        let b:CGFloat = colorRef[2]
        
        return String(format: "#%02lX%02lX%02lX", lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)))
    }
}
