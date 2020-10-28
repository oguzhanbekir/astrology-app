//
//  AuthenticationConstant.swift
//  AstrologyApp
//
//  Created by Oguzhan Bekir on 26.10.2020.
//

import Foundation

struct AuthenticationConstant {
    let user_id: String = "614654"
    let api_key: String = "67689e95fb62a87fb5533a404633e41d"
    let basicAauth : String
    let basicAuthData : Data
    let base64LoginString : String
    
    init() {
        basicAauth = String(format: "%@:%@", user_id, api_key)
        basicAuthData = basicAauth.data(using: String.Encoding.utf8)!
        base64LoginString = basicAuthData.base64EncodedString()
    }

}

