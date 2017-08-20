//
//  STPFightBackgroundView.swift
//  iSaveThePrincess
//
//  Created by Robin on 19/08/2017.
//  Copyright © 2017 Rob. All rights reserved.
//

import UIKit

class STPFightBackgroundView: UIView {
    
    // MARK: - Setup
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let colors: [CGColor] = Constants.kApplicationFightBackgroundGradientColors
        (layer as! CAGradientLayer).colors = colors
    }
}
