//
//  UserManager.swift
//  MostUselessPatterns
//
//  Created by Григорий Виняр on 23/06/2022.
//

import Foundation

struct User {
    let info: UserInfo
}

protocol UserManagerProtocol {
    func obtainMainUser() -> User
}

class UserManager: UserManagerProtocol {
    
    var userDefaults: UserDefaults!
    var userInfoService: UserInfoService!
    
    class func configuredManager() -> UserManager {
        
        let manager = UserManager()
        manager.userDefaults = UserDefaults.standard
        manager.userInfoService = UserInfoServiceIml.configuredService()
        return manager
    }
    
    func obtainMainUser() -> User {
        let info = userInfoService.obtainUserInfo()
        let user = User(info: info)
        return user
    }
    
}
