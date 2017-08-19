//
//  STPUtils.swift
//  iSaveThePrincess
//
//  Created by Robin on 19/08/2017.
//  Copyright © 2017 Rob. All rights reserved.
//

import SCLAlertView

struct Utils {

    static func showErrorAlert(withMessage message: String,
                               title: String = Constants.kErrorString,
                               andCloseButtonTitle closeButtonTitle: String = Constants.kOkString.uppercased()) {
        
        let appearance: SCLAlertView.SCLAppearance = SCLAlertView.SCLAppearance(kDefaultShadowOpacity: 0.5,
                                                                                kTitleFont: Constants.kApplicationTitleFont,
                                                                                kTextFont: Constants.kApplicationStandardFont,
                                                                                kButtonFont: Constants.kApplicationButtonFont,
                                                                                hideWhenBackgroundViewIsTapped: true)
        let alert = SCLAlertView(appearance: appearance)
        
        alert.showError(title,
                        subTitle: message,
                        closeButtonTitle: closeButtonTitle)
    }
}
