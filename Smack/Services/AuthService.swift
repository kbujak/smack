//
//  AuthService.swift
//  Smack
//
//  Created by Krystian Bujak on 20/02/2018.
//  Copyright © 2018 Krystian Bujak. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService{
    
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    internal var isLoggedIn: Bool{
        get{
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set{
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    internal var authToken: String{
        get{            
            return defaults.object(forKey: TOKEN_KEY) as! String
        }
        set{
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    internal var userEmail: String{
        get{
            return defaults.object(forKey: USER_EMAIL_KEY) as! String
        }
        set{
            defaults.set(newValue, forKey: USER_EMAIL_KEY)
        }
    }
    
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler){
        let lowerCaseEmail = email.lowercased()                
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { response in
            if response.result.error == nil{
                completion(true)
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func loginUser(email: String, password: String, completion: @escaping CompletionHandler){
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil{
                guard let data = response.data else { return }
                guard let json = try? JSON(data: data) else { return }
                self.userEmail = json["user"].stringValue
                self.authToken = json["token"].stringValue                
                self.isLoggedIn = true                
                completion(true)
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func createUser(name: String, email: String, avatarName: String, avatarColor: String, completion: @escaping CompletionHandler){
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "name": name,
            "email": lowerCaseEmail,
            "avatarName": avatarName,
            "avatarColor": avatarColor
        ]
        
        Alamofire.request(URL_USR_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil{
                guard let data = response.data else {return}
                self.setUserInfo(data: data)
                completion(true)
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func findUserByEmail(completion: @escaping CompletionHandler){
        Alamofire.request("\(URL_USER_BY_EMAIL)\(userEmail)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil{
                guard let data = response.data else {return}
                self.setUserInfo(data: data)
                completion(true)
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    private func setUserInfo(data: Data){
        guard let json = try? JSON(data: data) else {return}
        UserDataService.instance.setUserData(
        id: json["_id"].stringValue,
        color: json["avatarColor"].stringValue,
        avatarName: json["avatarName"].stringValue,
        email: json["email"].stringValue,
        name: json["name"].stringValue)
    }
}
