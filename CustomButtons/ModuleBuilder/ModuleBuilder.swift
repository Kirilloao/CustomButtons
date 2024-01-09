//
//  ModuleBuilder.swift
//  CustomButtons
//
//  Created by Kirill Taraturin on 24.12.2023.
//

import UIKit

// MARK: - ModuleBuilderProtocol
protocol ModuleBuilderProtocol {
    func createWelcomeModule(with router: RouterProtocol) -> UIViewController
    func createMainModule() -> UIViewController
}

// MARK: - ModuleBuilder
final class ModuleBuilder: ModuleBuilderProtocol {
    func createWelcomeModule(with router: RouterProtocol) -> UIViewController {
        let view = WelcomeViewController()
        let presenter = WelcomePresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createMainModule() -> UIViewController {
        let view = MainVC()
        let presenter = MainVCPresenter(view: view)
        view.presenter = presenter
        return view
    }
}
