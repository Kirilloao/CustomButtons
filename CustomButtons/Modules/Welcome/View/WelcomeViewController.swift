//
//  ViewController.swift
//  CustomButtons
//
//  Created by Kirill Taraturin on 24.12.2023.
//

import UIKit
import SnapKit

protocol WelcomeViewControllerProtocol: AnyObject {
    
}

final class WelcomeViewController: UIViewController {
    
    // MARK: - Presenter
    var presenter: WelcomePresenterProtocol!
    
    // MARK: - Private UI Properties
    private lazy var startButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()

    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
        view.backgroundColor = .white
    }
    
    // MARK: - Private Methods
    private func setViews() {
        view.addSubview(startButton)
    }
    
    private func setupConstraints() {
        startButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(150)
        }
    }
}

// MARK: - WelcomeViewControllerProtocol
extension WelcomeViewController: WelcomeViewControllerProtocol {
    
}

