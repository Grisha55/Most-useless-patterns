//
//  UserManager.swift
//  MostUselessPatterns
//
//  Created by Григорий Виняр on 23/06/2022.
//

import Foundation

@objc class User: NSObject {
    
    @objc dynamic var info: String
    
    init(info: String) {
        self.info = info
    }
}

protocol UserManagerProtocol {
    func obtainMainUser() -> User
}

class UserManager: UserManagerProtocol {
    
    var userDefaults: UserDefaults!
    var userInfoService: UserInfoService!
    
    private static let sharedUser = User(info: "First info")
    
    typealias Class = UserManager
    
    class func configuredManager() -> UserManager {
        
        let manager = UserManager()
        manager.userDefaults = UserDefaults.standard
        manager.userInfoService = ServiceFacadeRelease().configureUserInfoService()
        return manager
    }
    
    func obtainMainUser() -> User {
        
        let user = Class.sharedUser
        return user
    }
    
    func changeUserInfo(_ info: String) {
        Class.sharedUser.info = info
    }
    
}

// Пример: хэндлер по работе с пуш уведомлениями, по работе с изображениями
class UserInfoHandler {

}
