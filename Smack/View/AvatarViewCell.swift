//
//  AvatarViewCell.swift
//  Smack
//
//  Created by Krystian Bujak on 05/03/2018.
//  Copyright © 2018 Krystian Bujak. All rights reserved.
//

import UIKit

enum AvatarType{
    case dark
    case light
}

class AvatarViewCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func configureCell(index: Int, type: AvatarType){
        if type == .dark{
            avatarImg.image = UIImage(named: "dark\(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor
        }else{
            avatarImg.image = UIImage(named: "light\(index)")
            self.layer.backgroundColor = UIColor.gray.cgColor
        }
    }
    
    func setupView(){
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true 
    }
}
