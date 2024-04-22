//
//  ForgotPasswordView.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/21/24.
//

import UIKit

protocol ForgotPasswordDelegate: AnyObject {
    
}

class ForgotPasswordView: UIView {
    
    private let passwordLabel: UILabel = {
        let view = UILabel()
        view.text = "Reset your password"
        view.tintColor = .label
        view.font = .systemFont(ofSize: 24,
                                weight: .semibold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let deckriptionLabel: UILabel = {
        let view = UILabel()
        view.text = "Enter your registered email below"
        view.tintColor = .label
        view.font = .systemFont(ofSize: 13,
                                weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let emailTextField: PaddedTextField = {
        let view = PaddedTextField()
        view.placeholder = "Emial"
        view.tintColor = .label
        view.layer.cornerRadius = 26
        view.layer.borderColor = UIColor.label.cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let stackLabels: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let rememberlabel: UILabel = {
        let view = UILabel()
        view.text = "Remember the password?"
        view.tintColor = .label
        view.font = .systemFont(ofSize: 13,
                                weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let loginButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Login",
                      for: .normal)
        view.setTitleColor(.label,
                           for: UIControl.State.normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 13,
                                                  weight: .semibold)
        view.addTarget(self,
                       action: #selector(loginScreen),
                       for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var sumbitButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Sumbit",
                      for: .normal)
        view.tintColor = .black
        view.backgroundColor = UIColor().rgb(r: 251,
                                             g: 222,
                                             b: 63,
                                             alpha: 100)
        view.layer.cornerRadius = 26
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self,
                       action: #selector(ScreenTapped),
                       for: .touchUpInside)
        return view
    }()
    
    var screenTransilation: (() -> Void)?
    
    var loginScreenTransilation: (() -> Void)?
    
    weak var delegate: ForgotPasswordDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupAddSubview()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAddSubview() {
        addSubview(passwordLabel)
        addSubview(deckriptionLabel)
        addSubview(emailTextField)
        addSubview(stackLabels)
        stackLabels.addArrangedSubview(rememberlabel)
        stackLabels.addArrangedSubview(loginButton)
        addSubview(sumbitButton)
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: topAnchor,
                                               constant: 175),
            passwordLabel.leftAnchor.constraint(equalTo: leftAnchor,
                                                constant: 43),
            
            deckriptionLabel.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor,
                                                  constant: 18),
            deckriptionLabel.leftAnchor.constraint(equalTo: leftAnchor,
                                                   constant: 27),
            
            emailTextField.topAnchor.constraint(equalTo: deckriptionLabel.bottomAnchor,
                                                constant: 81),
            emailTextField.leftAnchor.constraint(equalTo: leftAnchor,
                                                 constant: 26),
            emailTextField.rightAnchor.constraint(equalTo: rightAnchor,
                                                  constant: -26),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            stackLabels.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,
                                             constant: 26),
            stackLabels.leftAnchor.constraint(equalTo: leftAnchor,
                                              constant: 76),
            stackLabels.rightAnchor.constraint(equalTo: rightAnchor,
                                               constant: -122),
            stackLabels.heightAnchor.constraint(equalToConstant: 20),
            
            sumbitButton.topAnchor.constraint(equalTo: stackLabels.bottomAnchor,
                                              constant: 265),
            sumbitButton.leftAnchor.constraint(equalTo: leftAnchor,
                                               constant: 26),
            sumbitButton.rightAnchor.constraint(equalTo: rightAnchor,
                                                constant: -26),
            sumbitButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc private func ScreenTapped() {
        screenTransilation?()
    }
    
    @objc private func loginScreen() {
        loginScreenTransilation?()
    }
}
