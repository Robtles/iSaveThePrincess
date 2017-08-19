//
//  UIImage+Extension.swift
//  iSaveThePrincess
//
//  Created by Robin on 19/08/2017.
//  Copyright © 2017 Rob. All rights reserved.
//

import UIKit

extension UIImage {
    
    // Helper function to tint an image with a coloured layer (but not the alpha part of the image)
    func tinted(color: UIColor) -> UIImage? {
        
        let image = self
        
        let rect:CGRect = CGRect(origin: CGPoint(x: 0, y: 0), size: image.size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, image.scale)
        
        let context = UIGraphicsGetCurrentContext()!
        image.draw(in: rect)
        context.setFillColor(color.withAlphaComponent(0.5).cgColor)
        context.setBlendMode(.sourceAtop)
        context.fill(rect)
        
        guard let result:UIImage = UIGraphicsGetImageFromCurrentImageContext() else {
            return nil
        }
        
        UIGraphicsEndImageContext()
        return result
    }
}
