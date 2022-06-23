//
//  DefaultAlertsFactory.swift
//  MostUselessPatterns
//
//  Created by Григорий Виняр on 23/06/2022.
//

import Foundation
import UIKit

enum DefaultAlerts {
    case okAlert
    case cancelAlert
    case unexpectedErrorAlert
}

// Фабрику можно использовать при создании разных ячеек
// Или, если мы работаем с множеством контроллеров (можем их возвращать)
protocol DefaultAlertsFactoryProtocol: AnyObject {
    
    func getAlert(by type: DefaultAlerts) -> UIViewController
}

class DefaultAlertsFactory: DefaultAlertsFactoryProtocol {
    
    func getAlert(by type: DefaultAlerts) -> UIViewController {
        
        switch type {
        case .okAlert             : return configureOkAlert()
        case .cancelAlert         : return configureCancelAlert()
        case .unexpectedErrorAlert: return configureErrorAlert()
        }
    }
    
    private func configureOkAlert() -> UIViewController {
        let alertController = UIAlertController(title: nil, message: "Hello", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(action)
        return alertController
    }
    
    private func configureCancelAlert() -> UIViewController {
        let alertController = UIAlertController(title: nil, message: "Cancel text", preferredStyle: .alert)
        let action = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alertController.addAction(action)
        return alertController
    }
    
    private func configureErrorAlert() -> UIViewController {
        let alertController = UIAlertController(title: nil, message: "Enexpected Error!!!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alertController.addAction(action)
        return alertController
    }
}
