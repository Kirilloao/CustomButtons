//
//  WelcomePresenter.swift
//  CustomButtons
//
//  Created by Kirill Taraturin on 24.12.2023.
//

import Foundation

// MARK: - WelcomePresenterProtocol
protocol WelcomePresenterProtocol {
    init(view: WelcomeViewControllerProtocol, router: RouterProtocol)
    func showMainVC()
}

// MARK: - WelcomePresenter
final class WelcomePresenter: WelcomePresenterProtocol {
    
    private unowned var view: WelcomeViewControllerProtocol
    private var router: RouterProtocol
    
    init(view: WelcomeViewControllerProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func showMainVC() {
        router.showMainVC()
    }
    
}
