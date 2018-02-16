//
//  LoginViewController.swift
//  Smack
//
//  Created by Krystian Bujak on 08/02/2018.
//  Copyright © 2018 Krystian Bujak. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: SegueIdentifier.TO_CREATE_ACCOUNT.rawValue, sender: self)
    }
    
}
