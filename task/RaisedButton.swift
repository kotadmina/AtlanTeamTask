//
//  RaisedButton.swift
//  task
//
//  Created by Sher Locked on 26.10.17.
//  Copyright © 2017 sherlocked. All rights reserved.
//

import UIKit

@IBDesignable
class RaisedButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var shadowOffsetX: CGFloat = 0 {
        didSet {
            self.layer.shadowOffset = CGSize(width: shadowOffsetX, height: self.layer.shadowOffset.height)
        }
    }
    
    @IBInspectable var shadowOffsetY: CGFloat = 0 {
        didSet {
            self.layer.shadowOffset = CGSize(width: self.layer.shadowOffset.width, height: shadowOffsetY)
        }
    }
    
    @IBInspectable var shadowColor: UIColor? = nil {
        didSet {
            self.layer.shadowColor = shadowColor?.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.0 {
        didSet {
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
            self.layer.shadowRadius = shadowRadius
        }
    }

}
