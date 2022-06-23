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
    
    var observation: NSKeyValueObservation?
    
    var trashManager = TrashManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        
        let user = userManager.obtainMainUser()
        print(user)
        
        let trash = Trash(type: .organic)
        trashManager.trashContainer.deal(with: trash)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        let alert = alertFacotry.getAlert(by: .unexpectedErrorAlert)
//        self.present(alert, animated: true)
        
        let user = userManager.obtainMainUser()
        
        observation = user.observe(\.info, options: .new) { updatedUser, change in
            
            print(updatedUser.info)
        }
        
        user.info = "New info!"
    }


}

// Паттерн Adapter используется тогда, когда мы используем расширения
extension ViewController: GreetingProtocol {
    
    func sayHello() {
        print("Hello")
    }
}

enum TrashType {
    case paper, plastic, organic
}

struct Trash {
    
    var type: TrashType
}

protocol TrashContainerProtocol {
    
    var diffTrash: TrashContainerProtocol? { get set }
    func deal(with trash: Trash?)
}

class PaperTrashContainer: TrashContainerProtocol {
    
    var diffTrash: TrashContainerProtocol?
    
    init(nextTrash: TrashContainerProtocol) {
        self.diffTrash = nextTrash
    }
    
    func deal(with trash: Trash?) {
        
        if trash?.type == .paper {
            print("deal with it paper")
        } else {
            diffTrash?.deal(with: trash)
        }
    }
}

class PlastictrashContainer: TrashContainerProtocol {
    
    var diffTrash: TrashContainerProtocol?
    
    init(nextTrash: TrashContainerProtocol) {
        self.diffTrash = nextTrash
    }
    
    func deal(with trash: Trash?) {
        if trash?.type == .plastic {
            print("deal with it plastic")
        } else {
            diffTrash?.deal(with: trash)
        }
    }
}

class OrganicTrashContainer: TrashContainerProtocol {
    
    var diffTrash: TrashContainerProtocol?
    
    init(nextTrash: TrashContainerProtocol?) {
        self.diffTrash = nextTrash
    }
    
    func deal(with trash: Trash?) {
        if trash?.type == .organic {
            print("deal with it organic")
        } else {
            print("Can't deal with it")
        }
    }
}

class TrashManager {
    
    var trashContainer: PaperTrashContainer
    
    init() {
        let organicTrash = OrganicTrashContainer(nextTrash: nil)
        let plasticTrash = PlastictrashContainer(nextTrash: organicTrash)
        let papertrash = PaperTrashContainer(nextTrash: plasticTrash)
        
        trashContainer = papertrash
    }
}
