//
//  RoundedImageView.swift
//  Smack
//
//  Created by Krystian Bujak on 10/03/2018.
//  Copyright © 2018 Krystian Bujak. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedImageView: UIImageView {

    override func awakeFromNib() {
        setup()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    func setup(){
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
}
