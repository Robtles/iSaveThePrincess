//
//  STPAddOrUpdateSoldierModalViewController.swift
//  iSaveThePrincess
//
//  Created by Robin on 19/08/2017.
//  Copyright © 2017 Rob. All rights reserved.
//

import UIKit
import SCLAlertView
import SVColorPicker
import AKPickerView

class STPAddOrUpdateSoldierModalViewController: STPOverlayedModalViewController {
    
    @IBOutlet weak var alertCenterYConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var soldierImageView: UIImageView!
    @IBOutlet weak var soldierNameTextField: UITextField!
    @IBOutlet weak var soldierColorLabel: UILabel!
    @IBOutlet weak var soldierColorContainerView: UIView!
    @IBOutlet weak var soldierGenderLabel: UILabel!
    @IBOutlet weak var soldierGenderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var soldierAgeLabel: UILabel!
    @IBOutlet weak var soldierAgeContainerView: UIView!
    @IBOutlet weak var updateOrAddButton: UIButton!
    @IBOutlet weak var trashImageView: UIImageView!
    
    var soldierColorPicker: ColorPickerView!
    var soldierAgePickerView: AKPickerView!
    
    var isUpdatingSoldier = false
    
    var currentSoldier: STPSoldier!
    var delegate: STPAddOrUpdateSoldierDelegate?
    
    // MARK: - Initializer
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.transitioningDelegate = self
    }
    
    // MARK: - Appplication lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.trashImageView.isHidden = !self.isUpdatingSoldier
        self.trashImageView.addTapGesture(target: self, action: #selector(trashTapped))
        
        self.soldierImageView.image = self.currentSoldier.gender.associatedSpriteImage
            .tinted(color: UIColor(hexString: self.currentSoldier.color)!)
        
        self.soldierNameTextField.text = self.currentSoldier.name
        self.soldierNameTextField.textColor = UIColor.darkGray
        self.soldierNameTextField.textAlignment = .center
        self.soldierNameTextField.font = Constants.kApplicationStandardFont
        self.soldierNameTextField.placeholder = Constants.kSoldierNameString
        self.soldierNameTextField.delegate = self
        self.soldierNameTextField.returnKeyType = .done
        self.soldierNameTextField.keyboardType = .asciiCapable
        self.soldierNameTextField.autocorrectionType = .no
        
        self.soldierColorLabel.font = Constants.kSemiboldHeaderFont
        self.soldierColorLabel.text = Constants.kColorString
        
        self.soldierColorPicker = ColorPickerView(frame: CGRect(x: 0,
                                                                y: 0,
                                                                w: self.view.size.width - 96,
                                                                h: self.soldierAgeContainerView.size.height))
        self.soldierColorPicker.colorPickerSliderHeight = 4.0
        self.soldierColorPicker.didChangeColor = { [unowned self] color in
            
            self.currentSoldier.color = (color?.hexString)!
            self.soldierImageView.image = self.currentSoldier.gender.associatedSpriteImage
                .tinted(color: UIColor(hexString: self.currentSoldier.color)!)
        }
        self.soldierColorContainerView.addSubview(self.soldierColorPicker)
        
        self.soldierGenderLabel.font = Constants.kSemiboldHeaderFont
        self.soldierGenderLabel.text = Constants.kGenderString
        
        for i in 0..<Constants.kSoldierTypeNames.count {
            self.soldierGenderSegmentedControl.setTitle(Constants.kSoldierTypeNames[i], forSegmentAt: i)
        }
        self.soldierGenderSegmentedControl.selectedSegmentIndex = self.currentSoldier.gender.rawValue
        
        self.soldierAgeLabel.font = Constants.kSemiboldHeaderFont
        self.soldierAgeLabel.text = Constants.kAgeString
        
        self.soldierAgePickerView = AKPickerView(frame: CGRect(x: 0,
                                                               y: 0,
                                                               w: self.view.size.width - 96,
                                                               h: self.soldierAgeContainerView.size.height))
        self.soldierAgePickerView.dataSource = self
        self.soldierAgePickerView.selectItem((Constants.kSoldierAges.index(of: self.currentSoldier.age)?.toUInt)!,
                                             animated: false)
        self.soldierAgePickerView.interitemSpacing = 5.0
        self.soldierAgePickerView.textColor = UIColor.lightGray
        self.soldierAgePickerView.font = Constants.kApplicationSmallFont
        self.soldierAgePickerView.highlightedTextColor = UIColor.black
        self.soldierAgePickerView.highlightedFont = Constants.kApplicationTitleFont
        
        self.soldierAgeContainerView.addSubview(self.soldierAgePickerView)
        
        let title = (self.isUpdatingSoldier) ? Constants.kUpdateString : Constants.kCreateString
        self.updateOrAddButton.createSTPBlueButton(withTitle: title)
    }
    
    static func presentIn(_ viewController: UIViewController,
                          delegate: STPAddOrUpdateSoldierDelegate,
                          updatingSoldier: STPSoldier? = nil) {
        
        let addOrUpdateSoldierModalViewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "addOrUpdateSoldierModalViewController") as! STPAddOrUpdateSoldierModalViewController
        addOrUpdateSoldierModalViewController.modalPresentationStyle = .overCurrentContext
        addOrUpdateSoldierModalViewController.isUpdatingSoldier = (updatingSoldier != nil)
        addOrUpdateSoldierModalViewController.currentSoldier = (updatingSoldier == nil) ? STPSoldier() : updatingSoldier
        addOrUpdateSoldierModalViewController.delegate = delegate
        
        if Thread.isMainThread {
            viewController.present(addOrUpdateSoldierModalViewController, animated: true, completion: nil)
        } else {
            DispatchQueue.main.async {
                viewController.present(addOrUpdateSoldierModalViewController, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: - IBActions
    @IBAction func alertMoving(_ sender: Any) {
        
        let gesture = sender as! UIPanGestureRecognizer
        
        switch gesture.state {
        case .ended:
            
            let velocity = gesture.velocity(in: self.alertView).y
            
            if fabs(velocity) / 10 < 30 {
                
                UIView.animate(withDuration: 0.25, animations: {
                    self.alertCenterYConstraint?.constant = 0.0
                    self.view.layoutIfNeeded()
                })
            } else {
                
                self.isDismissingByBottom = velocity > 0
                self.dismiss(animated: true, completion:nil)
            }
        case .began, .changed:
            
            let translation = gesture.translation(in: self.alertView)
            self.alertCenterYConstraint?.constant = translation.y
            self.view.layoutIfNeeded()
        default:
            break
        }
    }
    
    @IBAction func tapToDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion:nil)
    }
    
    @IBAction func genderValueChanged(_ sender: Any) {
        let segmentedControl = sender as! UISegmentedControl
        self.currentSoldier.gender = STPSoldierGenderEnum(rawValue: segmentedControl.selectedSegmentIndex)!
        self.soldierImageView.image = self.currentSoldier.gender.associatedSpriteImage
            .tinted(color: UIColor(hexString: self.currentSoldier.color)!)
    }
    
    @IBAction func addOrUpdateButtonTapped(_ sender: Any) {
        
        guard let nameTyped = self.soldierNameTextField.text, nameTyped.length > 0 else {
            
            Utils.showErrorAlert(withMessage: Constants.kPleaseEnterANameString)
            return
        }
        
        self.currentSoldier.name = nameTyped
        self.currentSoldier.age = Constants.kSoldierAges[Int(self.soldierAgePickerView.selectedItem)]
        if !self.isUpdatingSoldier {
            self.currentSoldier.index = STPRealmHelper.shared.incrementID()
        }
        
        if STPRealmHelper.shared.addOrUpdateSoldier(self.currentSoldier,
                                                    updating: self.isUpdatingSoldier) {
            
            self.delegate?.didUpdateSoldiersList()
            self.dismiss(animated: true, completion:nil)
        } else {
            Utils.showErrorAlert(withMessage: Constants.kCouldNotSaveSoldierString)
        }
    }
    
    @objc private func trashTapped() {
        
        let appearance: SCLAlertView.SCLAppearance = SCLAlertView.SCLAppearance(kDefaultShadowOpacity: 0.5,
                                                                                kTitleFont: Constants.kApplicationTitleFont,
                                                                                kTextFont: Constants.kApplicationStandardFont,
                                                                                kButtonFont: Constants.kApplicationButtonFont,
                                                                                hideWhenBackgroundViewIsTapped: true)
        let alert = SCLAlertView(appearance: appearance)
        
        alert.addButton(Constants.kDeleteString,
                        backgroundColor: Constants.kApplicationBlueTintColor,
                        textColor: UIColor.white) {
                            
                            if STPRealmHelper.shared.removeSoldier(self.currentSoldier.index) {
                                
                                self.delegate?.didUpdateSoldiersList()
                                self.dismiss(animated: true, completion: nil)
                            } else {
                                
                                Utils.showErrorAlert(withMessage: Constants.kErrorString,
                                                     title: Constants.kCouldNotDeleteSoldierString)
                            }
        }
        
        alert.showInfo(Constants.kConfirmString,
                       subTitle: Constants.kDeleteThisSoldierString,
                       closeButtonTitle: Constants.kNoString,
                       colorStyle: 0x07BDF7)
    }
}

// MARK: - Text Field Delegate
extension STPAddOrUpdateSoldierModalViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - Age Picker View Data Source
extension STPAddOrUpdateSoldierModalViewController: AKPickerViewDataSource {
    
    func numberOfItems(in pickerView: AKPickerView!) -> UInt {
        return UInt(Constants.kSoldierAges.count)
    }
    
    func pickerView(_ pickerView: AKPickerView!, titleForItem item: Int) -> String! {
        return "\(Constants.kSoldierAges[item])"
    }
}
