//
//  CustomButton.swift
//  CustomButtons
//
//  Created by Kirill Taraturin on 08.01.2024.
//

import UIKit

enum TypeButton {
    case whiteButton
    case redButton
    case greenButton
    case gradientButton
}

class CustomButton: UIButton {
    
    private let mainLabel = UILabel()
    private let secondaryLabel = UILabel()
    private lazy var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.green.withAlphaComponent(0.2).cgColor,
            UIColor.yellow.withAlphaComponent(0.2).cgColor,
            UIColor.red.withAlphaComponent(0.2).cgColor,
            UIColor.purple.withAlphaComponent(0.2).cgColor,
            UIColor.systemBlue.withAlphaComponent(0.2).cgColor
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        gradient.cornerRadius = layer.cornerRadius
        gradient.cornerRadius = 16
        gradient.masksToBounds = true
        return gradient
    }()
    
    init(_ buttonType: TypeButton) {
        super.init(frame: .zero)
        switch buttonType {
            
        case .whiteButton:
            self.setupButton(
                with: .white,
                mainTextColor: .customDarkGrey ?? .white,
                secondTextColor: .customGreyLabel ?? .white
            )
            
            setupLabel(
                mainLabel,
                text: "ПОКАЗАТЬ АЛЕРТ",
                textColor: .customDarkGrey ?? .white,
                font: .rubickMedium(ofSize: 16) ?? UIFont.systemFont(ofSize: 16)
            )
            
            setupLabel(
                secondaryLabel,
                text: "ДОПОЛНИТЕЛЬНЫЙ ТЕКСТ",
                textColor: .customLightGrey ?? .white,
                font: .rubickRegular(ofSize: 16) ?? UIFont.systemFont(ofSize: 16)
            )
        case .redButton:
            setupButton(
                with: .buttonRed ?? .white,
                mainTextColor: .white,
                secondTextColor: .white
            )
            
            setupLabel(
                mainLabel,
                text: "УВЕЛИЧИТЬ ПРОГРЕСС",
                textColor: .white,
                font: .rubickMedium(ofSize: 16) ?? UIFont.systemFont(ofSize: 16)
            )
            
            setupLabel(
                secondaryLabel,
                text: "ТЕКСТ",
                textColor: .white,
                font: .rubickRegular(ofSize: 16) ?? UIFont.systemFont(ofSize: 16)
            )
        case .greenButton:
            setupButton(
                with: .buttonGreen ?? .white,
                mainTextColor: .white,
                secondTextColor: .white
            )
            
            setupLabel(
                mainLabel,
                text: "УМЕНЬШИТЬ ПРОГРЕСС",
                textColor: .white,
                font: .rubickMedium(ofSize: 16) ?? UIFont.systemFont(ofSize: 16)
            )
            
            setupLabel(
                secondaryLabel,
                text: "ТЕКСТ",
                textColor: .white,
                font: .rubickRegular(ofSize: 16) ?? UIFont.systemFont(ofSize: 16)
            )
        case .gradientButton:
            self.backgroundColor = .clear
            layer.insertSublayer(gradientLayer, at: 0)
            layer.shadowOpacity = 1
            layer.shadowRadius = 0
            layer.shadowOffset = CGSize(width: 0, height: 2)
            layer.masksToBounds = false
            
            layer.cornerRadius = 16
            layer.borderWidth = 3
            
            layer.shadowColor = UIColor.customGreyNew?.cgColor
            layer.borderColor = UIColor.customGreyNew?.cgColor
            setupButton(
                with: .white,
                mainTextColor: .customDarkGrey ?? .white,
                secondTextColor: .customGreyLabel ?? .white
            )
            
            
            setupLabel(
                mainLabel,
                text: "ИЗМЕНИТЬ BACKGROUND",
                textColor: .customDarkGrey ?? .white,
                font: .rubickMedium(ofSize: 16) ?? UIFont.systemFont(ofSize: 16)
            )
            
            setupLabel(
                secondaryLabel,
                text: "ДОПОЛНИТЕЛЬНЫЙ ТЕКСТ",
                textColor: .customGreyLabel ?? .white,
                font: .rubickRegular(ofSize: 16) ?? UIFont.systemFont(ofSize: 16)
            )
        }
        
        addSubview(mainLabel)
        addSubview(secondaryLabel)
        mainLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
        }
        
        secondaryLabel.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(2)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
    }
    
    // MARK: - Private Methods
    private func setupButton(with backgroundColor: UIColor, mainTextColor: UIColor, secondTextColor: UIColor) {
        
        switch backgroundColor {
        case .white:
            layer.shadowColor = UIColor.customGreyNew?.cgColor
            layer.borderColor = UIColor.customGreyNew?.cgColor
        case .buttonRed ?? .white:
            layer.shadowColor = UIColor.buttonShadowRed?.cgColor
            layer.borderColor = UIColor.buttonShadowRed?.cgColor
        case .buttonGreen ?? .white:
            layer.shadowColor = UIColor.buttonShadowGreen?.cgColor
            layer.borderColor = UIColor.buttonShadowGreen?.cgColor
        default:
            layer.shadowColor = UIColor.customGreyNew?.cgColor
            layer.borderColor = UIColor.customGreyNew?.cgColor
        }
        
        layer.shadowOpacity = 1
        layer.shadowRadius = 0
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.masksToBounds = false
        self.backgroundColor = backgroundColor
        layer.cornerRadius = 16
        layer.borderWidth = 3
    }
    
    private func setupLabel(_ label: UILabel, text: String, textColor: UIColor, font: UIFont) {
        label.text = text
        label.textColor = textColor
        label.font = font
        label.textAlignment = .center
    }
    
}
