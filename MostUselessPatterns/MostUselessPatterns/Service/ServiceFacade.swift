//
//  ServiceFacade.swift
//  MostUselessPatterns
//
//  Created by Григорий Виняр on 23/06/2022.
//

import Foundation

protocol ServiceFacadeProtocol {
    
    func configureAuthService() -> AuthServiceProtocol
    func configureUserInfoService() -> UserInfoService
}

class ServiceFacadeRelease: ServiceFacadeProtocol {
    
    func configureAuthService() -> AuthServiceProtocol {
        return AuthService()
    }
    
    func configureUserInfoService() -> UserInfoService {
        
        let service = UserInfoServiceIml()
        service.urlSession = URLSession.shared
        
        return service
    }
}

class ServiceFacadeDebug: ServiceFacadeRelease {
    
    override func configureAuthService() -> AuthServiceProtocol {
        return AuthService()
    }
    
    override func configureUserInfoService() -> UserInfoService {
        return UserInfoServiceIml()
    }
}
