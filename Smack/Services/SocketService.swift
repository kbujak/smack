//
//  SocketService.swift
//  Smack
//
//  Created by Krystian Bujak on 22/03/2018.
//  Copyright © 2018 Krystian Bujak. All rights reserved.
//

import UIKit
import SocketIO

class SocketService: NSObject {

    static let instance = SocketService()
    
    override init() {
        super.init()
    }
    
    var socket: SocketIOClient = SocketIOClient(socketURL: URL(string: "\(BASE_URL)")!)
    
    public func establishConnection(){
        socket.connect()
    }
    
    public func closeConnection(){
        socket.disconnect()
    }
    
    public func createChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler){
        socket.emit("newChannel", channelName, channelDescription)
        completion(true)
    }
    
    public func getChannel(completion: @escaping CompletionHandler){
        socket.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String else { return }
            guard let channelDescription = dataArray[1] as? String else { return }
            guard let channelId = dataArray[2] as? String else { return }
            
            MessageService.instance.channels.append(Channel(id: channelId, channelTitle: channelName, description: channelDescription))
            completion(true)
        }
    }
}
