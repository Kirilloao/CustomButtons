//
//  Router.swift
//  CustomButtons
//
//  Created by Kirill Taraturin on 24.12.2023.
//

import UIKit

// MARK: - RouterMain
protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var moduleBuilder: ModuleBuilderProtocol? { get set }
}

// MARK: - RouterProtocol
protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showMainVC()
}

// MARK: - Router
final class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    var moduleBuilder: ModuleBuilderProtocol?
    
    init(navigationController: UINavigationController, moduleBuilder: ModuleBuilderProtocol) {
        self.navigationController = navigationController
        self.moduleBuilder = moduleBuilder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let welcomeVC = moduleBuilder?.createWelcomeModule(with: self) else {
                return
            }
            
            navigationController.viewControllers = [welcomeVC]
        }
    }
    
    func showMainVC() {
    }
}
