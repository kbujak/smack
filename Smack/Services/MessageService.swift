//
//  MessageService.swift
//  Smack
//
//  Created by Krystian Bujak on 18/03/2018.
//  Copyright © 2018 Krystian Bujak. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService{
    static let instance = MessageService()
    
    var channels = [Channel]()
    
    func findAllChannel(completion: @escaping CompletionHandler){
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil{
                guard let data = response.data else {return}
                do{
                    if let json = try JSON(data: data).array{
                        for item in json{
                            let name = item["name"].stringValue
                            let description = item["description"].stringValue
                            let id = item["_id"].stringValue
                            self.channels.append(Channel(id: id, channelTitle: name, description: description))
                        }
                        completion(true)
                    }
                }catch{
                    completion(false)
                }
            }else{
                debugPrint(response.result.error as Any)
                completion(false)
            }
        }
    }
}
