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
    
     private let emailTextField: PaddedTextField = {
        let view = PaddedTextField()
        view.layer.cornerRadius = 16
//          view.returnKeyType = .done
        view.layer.borderColor = UIColor.label.cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let emailLabel: UILabel = {
        let view = UILabel()
        view.tintColor = .systemGray5
        view.text = "Email"
        view.font = .systemFont(ofSize: 16,
                                weight: .regular)
        view.backgroundColor = .white
//        view.anchorPoint = CGPoint(x: 0,
//                                   y: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameTextField: PaddedTextField = {
      let view = PaddedTextField()
      view.placeholder = "Name"
      view.tintColor = .label
      view.layer.cornerRadius = 26
      view.layer.borderColor = UIColor.label.cgColor
      view.layer.borderWidth = 1
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
  }()
    
    private let numberTextField: PaddedTextField = {
      let view = PaddedTextField()
      view.placeholder = "Number"
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
        rightView.tag = 0
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

    
    private let SingupButton: UIButton = {
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
    
    private let leftLine: UIView = {
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

    private let rightLine: UIView = {
        let view = UIView()
        view.backgroundColor = .label
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let googleButton: UIButton = {
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

    private let facebookButton: UIButton = {
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAdd()
        emailTextField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAdd() {
        addSubview(LogoIcon)
        addSubview(emailTextField)
        addSubview(emailLabel)
        addSubview(nameTextField)
        addSubview(numberTextField)
        addSubview(passwordTextField)
        addSubview(confirmTextField)
        addSubview(SingupButton)
        addSubview(leftLine)
        addSubview(OrLabel)
        addSubview(rightLine)
        addSubview(googleButton)
        addSubview(facebookButton)
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
                
                emailLabel.leftAnchor.constraint(equalTo: emailTextField.leftAnchor,
                                                 constant: 15),
                
                emailLabel.centerYAnchor.constraint(equalTo: emailTextField.centerYAnchor),
                
                nameTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,
                                                   constant: 12),
                nameTextField.leftAnchor.constraint(equalTo: leftAnchor,
                                                    constant: 26),
                nameTextField.rightAnchor.constraint(equalTo: rightAnchor,
                                                     constant: -26),
                nameTextField.heightAnchor.constraint(equalToConstant: 50),
                
                numberTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor,
                                                     constant: 12),
                numberTextField.leftAnchor.constraint(equalTo: leftAnchor,
                                                      constant: 26),
                numberTextField.rightAnchor.constraint(equalTo: rightAnchor,
                                                       constant: -26),
                numberTextField.heightAnchor.constraint(equalToConstant: 50),
                
                passwordTextField.topAnchor.constraint(equalTo: numberTextField.bottomAnchor,
                                                       constant: 12),
                passwordTextField.leftAnchor.constraint(equalTo: leftAnchor,
                                                        constant: 26),
                passwordTextField.rightAnchor.constraint(equalTo: rightAnchor,
                                                         constant: -26),
                passwordTextField.heightAnchor.constraint(equalToConstant: 50),
                
                confirmTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,
                                                      constant: 12),
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
    }
    
    @objc func hideText(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        case 1:
            confirmTextField.isSecureTextEntry = !confirmTextField.isSecureTextEntry
        default:
            break
        }
    }
}

extension RegisterView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.1) {
            self.emailLabel.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            self.emailLabel.frame.origin = CGPoint(x: self.emailTextField.frame.origin.x + 15,
                                                   y: self.emailTextField.frame.minY - self.emailLabel.frame.height / 2)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.1) {
            self.emailLabel.transform = .identity
            self.emailLabel.frame.origin = CGPoint(x: self.emailTextField.frame.origin.x + 15,
                                                   y: self.emailTextField.frame.minY - self.emailLabel.frame.height / 5)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


