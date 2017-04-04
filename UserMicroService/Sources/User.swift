//
//  User.swift
//  UserMicroService
//
//  Created by DARKNIGHT on 31/03/2017.
//
//

import PerfectLib
import Foundation
import Turnstile
import TurnstileCrypto

class User : JSONConvertibleObject {
    
    static let registerName = "user"
    
    public var uniqueID: String
    public var username: String?
    public var password: String?
    public var apiKeySecret: String = URandom().secureToken
    
    public var facebookID: String?
    public var googleID: String?
    
    init(id: String) {
        uniqueID = id
    }
    
    var dict: [String: String] {
        return [ "id": uniqueID,
                 "username": username ?? "",
                 "password": password ?? "",
                 "api_key_id": uniqueID,
                 "api_key_secret": apiKeySecret
        ]
    }
    
    var json: String {
        if let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: []),
            let result = String(data: jsonData, encoding: .utf8) {
            return result
        }
        return ""
        
    }
}
