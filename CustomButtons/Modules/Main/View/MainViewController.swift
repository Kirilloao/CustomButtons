//
//  MainViewController.swift
//  CustomButtons
//
//  Created by Kirill Taraturin on 28.12.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    private var closeButton: UIButton = {
        var button = UIButton(type: .system)
        button.setImage(UIImage(named: "closeIcon"), for: .normal)
        button.tintColor = UIColor(red: 0.20, green: 0.23, blue: 0.25, alpha: 1.00)
        return button
    }()
    
    private var progressView: UIProgressView = {
        var view = UIProgressView()
        return view
    }()
    
    private var progressCountLabel: UILabel = {
        var label = UILabel()
        label.text = "0/10"
        label.textColor = UIColor(red: 0.53, green: 0.56, blue: 0.59, alpha: 1.00)
        return label
    }()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
    }
    
    private func setViews() {
        view.backgroundColor = .white
        view.addSubview(closeButton)
        view.addSubview(progressView)
    }
    
    
    private func setupConstraints() {
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
            make.left.equalToSuperview().offset(20)
        }
        
        progressView.snp.makeConstraints { make in
            make.leading.equalTo(closeButton.snp.trailing).offset(43)
            make.centerY.equalTo(closeButton.snp.centerY)
            make.width.equalTo(200)
            make.height.equalTo(10)
        }
    }
}
