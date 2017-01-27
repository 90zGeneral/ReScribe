//
//  RoundedButton.swift
//  ReScribe
//
//  Created by Roydon Jeffrey on 1/26/17.
//  Copyright © 2017 Italyte. All rights reserved.
//

import UIKit

//To show corner radius effects in the storyboard instantly
@IBDesignable

class RoundedButton: UIButton {
    
    //This will be added to the button's attribute inspector tab once the button is set to RoundedButton as it's class 
    @IBInspectable var cornerRadius: CGFloat = 30.0 {
        didSet {
            setupCustomView()
        }
    }
    
    //To show corner radius effects in the storyboard instantly
    override func prepareForInterfaceBuilder() {
        setupCustomView()
    }
    
    //Corner Radius assignment
    func setupCustomView() {
        layer.cornerRadius = cornerRadius
    }
}
