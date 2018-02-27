//
//  RoundedButton.swift
//  Smack
//
//  Created by Krystian Bujak on 26/02/2018.
//  Copyright © 2018 Krystian Bujak. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 3.0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    override func awakeFromNib() {
        setupView()
    }
    
    func setupView(){
        self.layer.cornerRadius = cornerRadius
    }
}
