//
//  CircleButton.swift
//  Scribe
//
//  Created by Mina Guirguis on 2/28/18.
//  Copyright © 2018 Mina Guirguis. All rights reserved.
//

import UIKit

@IBDesignable
class CircleButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 30 { //this allows us to edit buttons in storyboard
        didSet{
           setupView() //never want to write the same line of code twice
        }
        
    }
    override func prepareForInterfaceBuilder() {
        setupView() // never want to write the same line of code twice
    }
    
    func setupView() {
         layer.cornerRadius = cornerRadius
    }

}
