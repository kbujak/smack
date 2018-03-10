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
    @IBOutlet weak var UsrImage: UIImageView!
    
    
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            UsrImage.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
        }
    }
    
    @IBAction func createAccountButtonPressed(_ sender: Any) {
        guard let username = usernameTxt.text, username != "" else {return}
        guard let email = emailTxt.text, email != "" else {return}
        guard let password = passTxt.text, password != "" else {return}
        
        AuthService.instance.registerUser(email: email, password: password) { success in
            if success {
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success {
                        AuthService.instance.createUser(name: username, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (succes) in
                            if success{
                                print(UserDataService.instance.name)
                                print(UserDataService.instance.avatarName)
                                self.performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: self)
                            }
                        })
                    }
                })
            }
        }
    }
    
    @IBAction func pickAvatarButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: self)
    }
    
    @IBAction func pickBackgroundColorBtnPressed(_ sender: Any) {
        
    }
    
    @IBAction func dissmissPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: self)
    }
}
