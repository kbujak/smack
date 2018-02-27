//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Krystian Bujak on 13/02/2018.
//  Copyright © 2018 Krystian Bujak. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var userImg: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createAccountButtonPressed(_ sender: Any) {
//        guard let username = usernameTxt.text, username != "" else {return}
        guard let email = emailTxt.text, email != "" else {return}
        guard let password = passTxt.text, password != "" else {return}
        
        AuthService.instance.registerUser(email: email, password: password) { success in
            if success {
                print("User registered")
            }
        }
    }
    
    @IBAction func pickAvatarButtonPressed(_ sender: Any) {
    }
    
    @IBAction func pickBackgroundColorBtnPressed(_ sender: Any) {
        
    }
    
    @IBAction func dissmissPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: self)
    }
}
