//
//  ProfileVC.swift
//  Smack
//
//  Created by Krystian Bujak on 13/03/2018.
//  Copyright © 2018 Krystian Bujak. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logoutBtnPressed(_ sender: Any) {
        UserDataService.instance.logoutUser()
        dismiss(animated: true, completion: nil)
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
    }
    
    func setupView(){
        if AuthService.instance.isLoggedIn{
            userNameLabel.text = UserDataService.instance.name
            emailLabel.text = UserDataService.instance.email
            userImageView.image = UIImage(named: UserDataService.instance.avatarName)
            userImageView.backgroundColor = UserDataService.instance.returnBackgroundColor(from: UserDataService.instance.avatarColor)
        }
        backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeTap)))
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}
