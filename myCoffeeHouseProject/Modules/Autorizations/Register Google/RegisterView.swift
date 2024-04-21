//
//  RegisterView.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/20/24.
//

import UIKit

protocol RegisterViewDelegate: AnyObject {
    
}

class RegisterView: UIView {
    
    private let LogoIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "SuperFood")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var emailTextField: PaddedTextField = {
        let view = PaddedTextField()
        view.placeholder = "Emial"
        view.tintColor = .label
        view.layer.cornerRadius = 26
        view.layer.borderColor = UIColor.label.cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let passwordTextField: PaddedTextField = {
        let view = PaddedTextField()
        view.placeholder = "Password"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isSecureTextEntry = true
        view.layer.cornerRadius = 26
        view.layer.borderColor = UIColor.label.cgColor
        view.layer.borderWidth = 1
        let rightView = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        rightView.setBackgroundImage(UIImage(systemName: "eye.slash"), for: .normal)
        rightView.tintColor = .label
        rightView.addTarget(self, action: #selector(hideText), for: .touchUpInside)
        rightView.tag = 1
        view.rightView = rightView
        view.rightViewMode = .always
        view.tag = 1
        return view
    }()
    
    private let confirmTextField: PaddedTextField = {
        let view = PaddedTextField()
        view.placeholder = "confirm password"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isSecureTextEntry = true
        view.layer.cornerRadius = 26
        view.layer.borderColor = UIColor.label.cgColor
        view.layer.borderWidth = 1
        let rightView = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        rightView.setBackgroundImage(UIImage(systemName: "eye.slash"), for: .normal)
        rightView.tintColor = .label
        rightView.addTarget(self, action: #selector(hideText), for: .touchUpInside)
        rightView.tag = 1
        view.rightView = rightView
        view.rightViewMode = .always
        view.tag = 1
        return view
    }()

    
    private lazy var SingupButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Sing up",
                      for: .normal)
        view.tintColor = .black
        view.backgroundColor = UIColor().rgb(r: 251,
                                             g: 222,
                                             b: 63,
                                             alpha: 100)
        view.layer.cornerRadius = 26
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var leftLine: UIView = {
        let view = UIView()
        view.backgroundColor = .label
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let OrLabel: UILabel = {
        let view = UILabel()
        view.text = "OR"
        view.tintColor = .label
        view.font = .systemFont(ofSize: 15,
                                weight: .semibold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var rightLine: UIView = {
        let view = UIView()
        view.backgroundColor = .label
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var googleButton: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("Login with Google", for: .normal)
        view.setTitleColor(UIColor.label, for: .normal)
        view.layer.cornerRadius = 26
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        view.setImage(UIImage(named: "google"), for: .normal)
        view.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        view.layer.borderColor = UIColor.label.cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentHorizontalAlignment = .center
        return view
    }()

    private lazy var facebookButton: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("Login with Facebook", for: .normal)
        view.setTitleColor(UIColor.label, for: .normal)
        view.layer.cornerRadius = 26
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        view.setImage(UIImage(named: "facebook"), for: .normal)
        view.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        view.layer.borderColor = UIColor.label.cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentHorizontalAlignment = .center
        return view
    }()

    weak var delegate: RegisterViewDelegate?
    
    var screenTransition: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupAdd()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAdd() {
        addSubview(LogoIcon)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(confirmTextField)
        addSubview(SingupButton)
        addSubview(leftLine)
        addSubview(OrLabel)
        addSubview(rightLine)
        addSubview(googleButton)
        addSubview(facebookButton)
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            LogoIcon.topAnchor.constraint(equalTo: topAnchor,
                                          constant: 69),
            LogoIcon.leftAnchor.constraint(equalTo: leftAnchor,
                                           constant: 121),
            LogoIcon.rightAnchor.constraint(equalTo: rightAnchor,
                                            constant: -121),
            LogoIcon.heightAnchor.constraint(equalToConstant: 110),
            
            emailTextField.topAnchor.constraint(equalTo: LogoIcon.bottomAnchor,
                                                constant: 47),
            emailTextField.leftAnchor.constraint(equalTo: leftAnchor,
                                                 constant: 26),
            emailTextField.rightAnchor.constraint(equalTo: rightAnchor,
                                                  constant: -26),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,
                                                   constant: 28),
            passwordTextField.leftAnchor.constraint(equalTo: leftAnchor,
                                                    constant: 26),
            passwordTextField.rightAnchor.constraint(equalTo: rightAnchor,
                                                     constant: -26),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            confirmTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,
                                                  constant: 28),
            confirmTextField.leftAnchor.constraint(equalTo: leftAnchor,
                                                   constant: 26),
            confirmTextField.rightAnchor.constraint(equalTo: rightAnchor,
                                                    constant: -26),
            confirmTextField.heightAnchor.constraint(equalToConstant: 50),
            
            SingupButton.topAnchor.constraint(equalTo: confirmTextField.bottomAnchor,
                                             constant: 30),
            SingupButton.leftAnchor.constraint(equalTo: leftAnchor,
                                              constant: 26),
            SingupButton.rightAnchor.constraint(equalTo: rightAnchor,
                                               constant: -26),
            SingupButton.heightAnchor.constraint(equalToConstant: 50),
            
            leftLine.topAnchor.constraint(equalTo: SingupButton.bottomAnchor,
                                          constant: 45),
            leftLine.leftAnchor.constraint(equalTo: leftAnchor,
                                           constant: 43),
            leftLine.widthAnchor.constraint(equalToConstant: 125),
            leftLine.heightAnchor.constraint(equalToConstant: 1),
            
            OrLabel.topAnchor.constraint(equalTo: SingupButton.bottomAnchor,
                                         constant: 33),
            OrLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            rightLine.topAnchor.constraint(equalTo: SingupButton.bottomAnchor,
                                          constant: 45),
            rightLine.rightAnchor.constraint(equalTo: rightAnchor,
                                           constant: -43),
            rightLine.widthAnchor.constraint(equalToConstant: 125),
            rightLine.heightAnchor.constraint(equalToConstant: 1),
            
            googleButton.topAnchor.constraint(equalTo: OrLabel.bottomAnchor,
                                              constant: 33),
            googleButton.leftAnchor.constraint(equalTo: leftAnchor,
                                               constant: 26),
            googleButton.rightAnchor.constraint(equalTo: rightAnchor,
                                                constant: -26),
            googleButton.heightAnchor.constraint(equalToConstant: 50),
            
            facebookButton.topAnchor.constraint(equalTo: googleButton.bottomAnchor,
                                                constant: 21),
            facebookButton.leftAnchor.constraint(equalTo: leftAnchor,
                                                 constant: 26),
            facebookButton.rightAnchor.constraint(equalTo: rightAnchor,
                                                  constant: -26),
            facebookButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
        SingupButton.addTarget(self, action: #selector(screenTransitionss), for: .touchUpInside)
    }
    
    @objc func hideText(_ sender: UIButton) {
        if sender.tag == 1 {
            passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        }
    }
    
    @objc private func screenTransitionss() {
        screenTransition?()
    }
    
}
