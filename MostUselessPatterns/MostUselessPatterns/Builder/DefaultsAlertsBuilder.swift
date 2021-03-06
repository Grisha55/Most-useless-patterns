//
//  DefaultsAlertsBuilder.swift
//  MostUselessPatterns
//
//  Created by Григорий Виняр on 23/06/2022.
//

import Foundation
import UIKit


// Если нам не нужны динамические параметры в методах, то мы спокойно можем использовать паттерн Factory
protocol DefaultsAlertsBuilderProtocol {
    func buildOkAlert(with title: String, message: String) -> UIViewController
    func buildCancelAlert(with message: String, handler: (() -> Void)?) -> UIViewController
}

class DefaultsAlertsBuilder: DefaultsAlertsBuilderProtocol {
    
    func buildOkAlert(with title: String, message: String) -> UIViewController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(action)
        return alertController
    }
    
    func buildCancelAlert(with message: String, handler: (() -> Void)?) -> UIViewController {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Cancel", style: .default) { _ in
            handler?()
        }
        
        alertController.addAction(action)
        return alertController
    }
    
}
