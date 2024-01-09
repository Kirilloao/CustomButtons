//
//  MainViewControllerPresenter.swift
//  CustomButtons
//
//  Created by Kirill Taraturin on 09.01.2024.
//

import UIKit

protocol MainVCPresenterProtocol {
    init(view: MainVCProtocol)
    func closeScreen()
}

final class MainVCPresenter: MainVCPresenterProtocol {
    
    private unowned var view: MainVCProtocol
    
    init(view: MainVCProtocol) {
        self.view = view
    }
    
    func closeScreen() {
        view.closeScreen()
    }
}
