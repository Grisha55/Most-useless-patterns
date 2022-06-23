//
//  UserInfoService.swift
//  MostUselessPatterns
//
//  Created by Григорий Виняр on 23/06/2022.
//

import Foundation

struct UserInfo {
    var name: String
    var age: String
}

protocol UserInfoService: AnyObject {
    func obtainUserInfo() -> UserInfo
}

class UserInfoServiceIml: UserInfoService {
    
    var urlSession: URLSession!
    
    static func configuredService() -> UserInfoService {
        
        let service = UserInfoServiceIml()
        service.urlSession = URLSession.shared
        
        return service
    }
    
    func obtainUserInfo() -> UserInfo {
        return UserInfo(name: "Gregory", age: "17")
    }
    
}
