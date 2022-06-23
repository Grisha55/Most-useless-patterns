//
//  ViewController.swift
//  MostUselessPatterns
//
//  Created by Григорий Виняр on 23/06/2022.
//

import UIKit

protocol GreetingProtocol {
    func sayHello()
}

class ViewController: UIViewController {

    var alertFacotry = DefaultAlertsFactory()
    var alertBuilder = DefaultsAlertsBuilder()
    
    var userManager = UserManager.configuredManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        
        let user = userManager.obtainMainUser()
        print(user)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        let alert = alertFacotry.getAlert(by: .unexpectedErrorAlert)
//        self.present(alert, animated: true)
        
        let alert = alertBuilder.buildOkAlert(with: "It's ok alert", message: "It's easy")
        self.present(alert, animated: true)
    }


}

// Паттерн Adapter используется тогда, когда мы используем расширения
extension ViewController: GreetingProtocol {
    
    func sayHello() {
        print("Hello")
    }
}
