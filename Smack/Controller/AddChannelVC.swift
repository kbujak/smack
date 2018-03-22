//
//  AddChannelVC.swift
//  Smack
//
//  Created by Krystian Bujak on 20/03/2018.
//  Copyright © 2018 Krystian Bujak. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }

    @IBAction func createChannelPressed(_ sender: Any) {
        guard let name = nameTextField.text, name != "" else {return}
        guard let description = descriptionTextField.text, description != "" else {return}
        SocketService.instance.createChannel(channelName: name, channelDescription: description) { (succes) in
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    private func setupView(){
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(closeTap(_:)))
        self.view.addGestureRecognizer(closeTouch )
        nameTextField.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedStringKey.foregroundColor: SMACK_PURPLE_PLACEHOLDER_COLOR])
        descriptionTextField.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedStringKey.foregroundColor: SMACK_PURPLE_PLACEHOLDER_COLOR])
    }
    
    @objc private func closeTap(_ recognizer: UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }
}
