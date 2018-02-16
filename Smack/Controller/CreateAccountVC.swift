//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Krystian Bujak on 13/02/2018.
//  Copyright © 2018 Krystian Bujak. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func dissmissPressed(_ sender: Any) {
        performSegue(withIdentifier: SegueIdentifier.UNWIND_TO_CHANNEL.rawValue, sender: self)
    }
}
