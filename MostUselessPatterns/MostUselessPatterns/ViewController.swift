//
//  ViewController.swift
//  MostUselessPatterns
//
//  Created by Григорий Виняр on 23/06/2022.
//

import UIKit

class ViewController: UIViewController {

    var alertFacotry = DefaultAlertsFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let alert = alertFacotry.getAlert(by: .unexpectedErrorAlert)
        self.present(alert, animated: true)
    }


}

