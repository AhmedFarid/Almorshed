//
//  roundedButton.swift
//  Almorshed
//
//  Created by Farido on 1/27/19.
//  Copyright © 2019 Bakers. All rights reserved.
//

import UIKit

@IBDesignable
class roundedButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
