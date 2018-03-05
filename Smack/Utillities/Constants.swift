//
//  Constants.swift
//  Smack
//
//  Created by Krystian Bujak on 08/02/2018.
//  Copyright © 2018 Krystian Bujak. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()


let BASE_URL = "https://booyacchatv2.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USR_ADD = "\(BASE_URL)user/add"

// Segue identifiers
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAcount"
let UNWIND_TO_CHANNEL = "unwindToChannel"

// User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL_KEY = "userEmail"

//Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

