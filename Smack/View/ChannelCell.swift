//
//  ChannelCell.swift
//  Smack
//
//  Created by Krystian Bujak on 20/03/2018.
//  Copyright © 2018 Krystian Bujak. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected{
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
        }else{
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }

    func configureCell(channel: Channel){
        let name = channel.channelTitle ?? ""
        self.titleLabel.text = "#\(name)"
    }
}
