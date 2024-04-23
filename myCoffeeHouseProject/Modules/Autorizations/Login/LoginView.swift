//
//  LoginView.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/20/24.
//

import UIKit
import SnapKit

class LoginView: UIView {
    
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
    
    private lazy var LoginButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Login",
                      for: .normal)
        view.tintColor = .black
        view.layer.cornerRadius = 16
        view.backgroundColor = UIColor().rgb(r: 251,
                                             g: 222,
                                             b: 63,
                                             alpha: 100)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self,
                       action: #selector(loginButtonTapped),
                       for: .touchUpInside)
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

    
    private let forgetButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Forgot password?",
                      for: .normal)
        view.tintColor = .label
        view.addTarget(self,
                       action: #selector(forgotButtonTapped),
                       for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var googleButton: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("Login with Google", for: .normal)
        view.setTitleColor(UIColor.label, for: .normal)
        view.layer.cornerRadius = 16
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
        view.layer.cornerRadius = 16
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        view.setImage(UIImage(named: "facebook"), for: .normal)
        view.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        view.layer.borderColor = UIColor.label.cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentHorizontalAlignment = .center
        return view
    }()
    
    weak var delegate: LoginViewControllerDelegate?
    
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
        addSubview(forgetButton)
        addSubview(LoginButton)
        addSubview(leftLine)
        addSubview(OrLabel)
        addSubview(rightLine)
        addSubview(googleButton)
        addSubview(facebookButton)
    }

    private func setupConstrains() {
        LogoIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(69)
            make.left.equalToSuperview().offset(121)
            make.right.equalToSuperview().offset(-121)
            make.height.equalTo(110)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(LogoIcon.snp.bottom).offset(47)
            make.left.equalToSuperview().offset(26)
            make.right.equalToSuperview().offset(-26)
            make.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(28)
            make.left.equalToSuperview().offset(26)
            make.right.equalToSuperview().offset(-26)
            make.height.equalTo(50)
        }
        
        forgetButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(21)
            make.right.equalToSuperview().offset(-31)
            make.height.equalTo(23)
            make.width.equalTo(127)
        }
        
        LoginButton.snp.makeConstraints { make in
            make.top.equalTo(forgetButton.snp.bottom).offset(21)
            make.left.equalToSuperview().offset(26)
            make.right.equalToSuperview().offset(-26)
            make.height.equalTo(50)
        }
        
        leftLine.snp.makeConstraints { make in
            make.top.equalTo(LoginButton.snp.bottom).offset(45)
            make.left.equalToSuperview().offset(43)
            make.width.equalTo(125)
            make.height.equalTo(1)
        }
        
        OrLabel.snp.makeConstraints { make in
            make.top.equalTo(LoginButton.snp.bottom).offset(35)
            make.centerX.equalToSuperview()
        }
        
        rightLine.snp.makeConstraints { make in
            make.top.equalTo(LoginButton.snp.bottom).offset(45)
            make.right.equalToSuperview().offset(-43)
            make.width.equalTo(125)
            make.height.equalTo(1)
        }
        
        googleButton.snp.makeConstraints { make in
            make.top.equalTo(OrLabel.snp.bottom).offset(33)
            make.left.equalToSuperview().offset(26)
            make.right.equalToSuperview().offset(-26)
            make.height.equalTo(50)
        }
        
        facebookButton.snp.makeConstraints { make in
            make.top.equalTo(googleButton.snp.bottom).offset(21)
            make.left.equalToSuperview().offset(26)
            make.right.equalToSuperview().offset(-26)
            make.height.equalTo(50)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-147)
        }
    }

    
    @objc 
    private func hideText(_ sender: UIButton) {
        if sender.tag == 1 {
            passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        }
    }
    
    @objc
    private func loginButtonTapped() {
        delegate?.didLoginButton()
      }
    
    @objc
    private func forgotButtonTapped() {
        delegate?.didForgotButton()
    }
}
