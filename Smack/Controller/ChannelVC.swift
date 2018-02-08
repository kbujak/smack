//
//  ChannelVC.swift
//  Smack
//
//  Created by Krystian Bujak on 08/02/2018.
//  Copyright © 2018 Krystian Bujak. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.width - 60
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
