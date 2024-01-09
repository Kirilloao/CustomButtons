//
//  MainViewController.swift
//  CustomButtons
//
//  Created by Kirill Taraturin on 28.12.2023.
//

import UIKit
import SnapKit

protocol MainVCProtocol: AnyObject {
    func closeScreen()
}

final class MainVC: UIViewController {
    
    // MARK: - Presenter
    var presenter: MainVCPresenterProtocol!
    
    // MARK: - Private UI Properties
    private lazy var closeButton: UIButton = {
        var button = UIButton(type: .system)
        button.setImage(UIImage(named: "closeIcon"), for: .normal)
        button.tintColor = UIColor.customDarkGrey
        button.addTarget(
            self,
            action: #selector(closeButtonDidTapped),
            for: .touchUpInside
        )
        return button
    }()
    
    private lazy var progressView: UIProgressView = {
        var view = UIProgressView()
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.backgroundColor = UIColor.customGreyNew
        return view
    }()
    
    private lazy var progressCountLabel: UILabel = {
        var label = UILabel()
        label.text = "0/10"
        label.textColor = UIColor(red: 0.53, green: 0.56, blue: 0.59, alpha: 1.00)
        label.font = UIFont.rubickRegular(ofSize: 20)
        return label
    }()
    
    private var showAlertButton: CustomButton = {
        var button = CustomButton(.whiteButton)
        button.addTarget(
            self,
            action: #selector(buttonPressed(_:)),
            for: .touchDown
        )
        
        button.addTarget(
            self, action: #selector(buttonReleased(_:)),
            for: [.touchUpInside, .touchUpOutside]
        )
        return button
    }()
    
    private var increaseProgressButton: CustomButton = {
        var button = CustomButton(.redButton)
        button.addTarget(
            self,
            action: #selector(buttonPressed(_:)),
            for: .touchDown
        )
        
        button.addTarget(
            self, action: #selector(buttonReleased(_:)),
            for: [.touchUpInside, .touchUpOutside]
        )
        return button
    }()
    
    private var reduceProgressButton: CustomButton = {
        var button = CustomButton(.greenButton)
        button.addTarget(
            self,
            action: #selector(buttonPressed(_:)),
            for: .touchDown
        )
        
        button.addTarget(
            self, action: #selector(buttonReleased(_:)),
            for: [.touchUpInside, .touchUpOutside]
        )
        return button
    }()
    
    private var changeBackgroundButton: CustomButton = {
        var button = CustomButton(.gradientButton)
        button.addTarget(
            self,
            action: #selector(buttonPressed(_:)),
            for: .touchDown
        )
        
        button.addTarget(
            self, action: #selector(buttonReleased(_:)),
            for: [.touchUpInside, .touchUpOutside]
        )
        return button
    }()
    
    // MARK: - Constraints
    private var alertButtonConstraint: Constraint?
    private var increaseButtonConstraint: Constraint?
    private var reduceButtonConstraint: Constraint?
    private var changeButtonConstraint: Constraint?
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
    }
    
    // MARK: - Private Actions
    @objc func buttonPressed(_ sender: UIButton) {
        
        switch sender {
        case showAlertButton:
            alertButtonConstraint?.update(offset: 152)
            increaseButtonConstraint?.update(offset: 8)
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
                sender.layer.shadowOffset = CGSize(width: 0, height: 0)
            }
        case increaseProgressButton:
            increaseButtonConstraint?.update(offset: 12)
            reduceButtonConstraint?.update(offset: 8)
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
                sender.layer.shadowOffset = CGSize(width: 0, height: 0)
            }
            
        case reduceProgressButton:
            reduceButtonConstraint?.update(offset: 12)
            changeButtonConstraint?.update(offset: 8)
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
                sender.layer.shadowOffset = CGSize(width: 0, height: 0)
            }
        default:
            changeButtonConstraint?.update(offset: 12)
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
                sender.layer.shadowOffset = CGSize(width: 0, height: 0)
            }
        }
    }
    
    @objc func buttonReleased(_ sender: UIButton) {
        switch sender {
        case showAlertButton:
            alertButtonConstraint?.update(offset: 150)
            increaseButtonConstraint?.update(offset: 10)
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
                sender.layer.shadowOffset = CGSize(width: 0, height: 2)
            }
        case increaseProgressButton:
            increaseButtonConstraint?.update(offset: 10)
            reduceButtonConstraint?.update(offset: 10)
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
                sender.layer.shadowOffset = CGSize(width: 0, height: 2)
            }
            
        case reduceProgressButton:
            reduceButtonConstraint?.update(offset: 10)
            changeButtonConstraint?.update(offset: 10)
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
                sender.layer.shadowOffset = CGSize(width: 0, height: 2)
            }
        default:
            changeButtonConstraint?.update(offset: 10)
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
                sender.layer.shadowOffset = CGSize(width: 0, height: 2)
            }
        }
    }
    
    @objc private func closeButtonDidTapped() {
        closeScreen()
    }
}

// MARK: - MainViewControllerProtocol
extension MainVC: MainVCProtocol {
    func closeScreen() {
        dismiss(animated: true)
    }
}

// MARK: - Setup UI
private extension MainVC {
    func setViews() {
        view.backgroundColor = .white
        [closeButton,
         progressView,
         progressCountLabel,
         showAlertButton,
         increaseProgressButton,
         reduceProgressButton,
         changeBackgroundButton].forEach { view.addSubview($0)}
    }
    
    func setupConstraints() {
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
            make.left.equalToSuperview().offset(20)
        }
        
        progressView.snp.makeConstraints { make in
            make.leading.equalTo(closeButton.snp.trailing).offset(43)
            make.centerY.equalTo(closeButton.snp.centerY)
            make.trailing.equalTo(progressCountLabel.snp.leading).offset(-32)
            make.height.equalTo(10)
        }
        
        progressCountLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalTo(closeButton.snp.centerY)
        }
        
        showAlertButton.snp.makeConstraints { make in
            
            alertButtonConstraint = make.top.equalTo(progressView.snp.top).offset(150).constraint
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(72)
        }
        
        increaseProgressButton.snp.makeConstraints { make in
            increaseButtonConstraint = make.top.equalTo(showAlertButton.snp.bottom).offset(10).constraint
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(72)
        }
        
        reduceProgressButton.snp.makeConstraints { make in
            reduceButtonConstraint = make.top.equalTo(increaseProgressButton.snp.bottom).offset(10).constraint
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(72)
        }
        
        changeBackgroundButton.snp.makeConstraints { make in
            changeButtonConstraint = make.top.equalTo(reduceProgressButton.snp.bottom).offset(10).constraint
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(72)
        }
    }
}
