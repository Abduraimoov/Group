//
//  RegisterView.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/20/24.
//

import UIKit
import SnapKit

class RegisterView: UIView {
    
    private let LogoIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "SuperFood")
        return view
    }()
    
    private let emailTextField: PaddedTextField = {
        let view = PaddedTextField()
        view.layer.borderColor = UIColor.label.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private let emailLabel: UILabel = {
        let view = UILabel()
        view.tintColor = .systemGray5
        view.text = " Email "
        view.font = .systemFont(
            ofSize: 16,
            weight: .regular)
        view.backgroundColor = .white
        return view
    }()
    
    private let nameTextField: PaddedTextField = {
        let view = PaddedTextField()
        view.tintColor = .label
        view.layer.borderColor = UIColor.label.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private let nameLabel: UILabel = {
        let view = UILabel()
        view.tintColor = .systemGray5
        view.text = " Name "
        view.font = .systemFont(
            ofSize: 16,
            weight: .regular)
        view.backgroundColor = .white
        return view
    }()
    
    private let numberTextField: PaddedTextField = {
        let view = PaddedTextField()
        view.layer.borderColor = UIColor.label.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private let numberLabel: UILabel = {
        let view = UILabel()
        view.tintColor = .systemGray5
        view.text = " Number "
        view.font = .systemFont(
            ofSize: 16,
            weight: .regular)
        view.backgroundColor = .white
        return view
    }()
    
    private let passwordTextField: PaddedTextField = {
        let view = PaddedTextField()
        view.isSecureTextEntry = true
        view.layer.borderColor = UIColor.label.cgColor
        view.layer.borderWidth = 1
        let rightView = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: 24,
            height: 24))
        rightView.setBackgroundImage(UIImage(
            systemName: "eye.slash"),
                                     for: .normal)
        rightView.tintColor = .label
        rightView.tag = 0
        view.rightView = rightView
        view.rightViewMode = .always
        view.tag = 1
        return view
    }()
    
    private let passwordLabel: UILabel = {
        let view = UILabel()
        view.tintColor = .systemGray5
        view.text = " Password "
        view.font = .systemFont(
            ofSize: 16,
            weight: .regular)
        view.backgroundColor = .white
        return view
    }()
    
    private let confirmTextField: PaddedTextField = {
        let view = PaddedTextField()
        view.isSecureTextEntry = true
        view.layer.borderColor = UIColor.label.cgColor
        view.layer.borderWidth = 1
        let rightView = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: 24,
            height: 24))
        rightView.setBackgroundImage(UIImage(
            systemName: "eye.slash"),
                                     for: .normal)
        rightView.tintColor = .label
        rightView.tag = 1
        view.rightView = rightView
        view.rightViewMode = .always
        view.tag = 1
        return view
    }()
    
    private let confirmLabel: UILabel = {
        let view = UILabel()
        view.tintColor = .systemGray5
        view.text = " Confirm password "
        view.font = .systemFont(
            ofSize: 16,
            weight: .regular)
        view.backgroundColor = .white
        return view
    }()
    
    
    private let SingupButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Sing up",
                      for: .normal)
        view.tintColor = .black
        view.backgroundColor = UIColor().rgb(
            r: 251,
            g: 222,
            b: 63,
            alpha: 100)
        view.layer.cornerRadius = 16
        return view
    }()
    
    private let leftLine: UIView = {
        let view = UIView()
        view.backgroundColor = .label
        return view
    }()
    
    private let OrLabel: UILabel = {
        let view = UILabel()
        view.text = "OR"
        view.tintColor = .label
        view.font = .systemFont(ofSize: 15,
                                weight: .semibold)
        return view
    }()
    
    private let rightLine: UIView = {
        let view = UIView()
        view.backgroundColor = .label
        return view
    }()
    
    private let googleButton: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("Login with Google", for: .normal)
        view.setTitleColor(
            UIColor.label,
            for: .normal)
        view.layer.cornerRadius = 16
        view.titleLabel?.font = UIFont.systemFont(
            ofSize: 16,
            weight: .medium)
        view.setImage(UIImage(
            named: "google"),
                      for: .normal)
        view.titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: 20,
            bottom: 0,
            right: 0)
        view.layer.borderColor = UIColor.label.cgColor
        view.layer.borderWidth = 1
        view.contentHorizontalAlignment = .center
        return view
    }()
    
    private let facebookButton: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle(
            "Login with Facebook",
            for: .normal)
        view.setTitleColor(
            UIColor.label,
            for: .normal)
        view.layer.cornerRadius = 16
        view.titleLabel?.font = UIFont.systemFont(
            ofSize: 16,
            weight: .medium)
        view.setImage(UIImage(
            named: "facebook"),
                      for: .normal)
        view.titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: 20,
            bottom: 0,
            right: 0)
        view.layer.borderColor = UIColor.label.cgColor
        view.layer.borderWidth = 1
        view.contentHorizontalAlignment = .center
        return view
    }()
    
    weak var delegate: RegisterViewControllerDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAdd()
        setupConstraints()
        setupDelegates()
        setupAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAddTarget() {
        passwordTextField.addTarget(
            self,
            action: #selector(hideText),
            for: .touchUpInside)
        confirmTextField.addTarget(
            self,
            action: #selector(hideText),
            for: .touchUpInside)
        SingupButton.addTarget(
            self,
            action: #selector(SingupTapped)
            , for: .touchUpInside)
    }
    
    private func setupAdd() {
        addSubview(LogoIcon)
        addSubview(emailTextField)
        addSubview(emailLabel)
        addSubview(nameTextField)
        addSubview(nameLabel)
        addSubview(numberTextField)
        addSubview(numberLabel)
        addSubview(passwordTextField)
        addSubview(passwordLabel)
        addSubview(confirmTextField)
        addSubview(confirmLabel)
        addSubview(SingupButton)
        addSubview(leftLine)
        addSubview(OrLabel)
        addSubview(rightLine)
        addSubview(googleButton)
        addSubview(facebookButton)
    }
    
    private func setupConstraints() {
        LogoIcon.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(125)
            make.right.equalToSuperview().offset(-125)
            make.height.equalTo(150)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(LogoIcon.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(26)
            make.right.equalToSuperview().offset(-26)
            make.height.equalTo(50)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.left.equalTo(emailTextField).offset(15)
            make.centerY.equalTo(emailTextField)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(26)
            make.right.equalToSuperview().offset(-26)
            make.height.equalTo(50)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(nameTextField).offset(15)
            make.centerY.equalTo(nameTextField)
        }
        
        numberTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(26)
            make.right.equalToSuperview().offset(-26)
            make.height.equalTo(50)
        }
        
        numberLabel.snp.makeConstraints { make in
            make.left.equalTo(numberTextField).offset(15)
            make.centerY.equalTo(numberTextField)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(numberTextField.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(26)
            make.right.equalToSuperview().offset(-26)
            make.height.equalTo(50)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.left.equalTo(passwordTextField).offset(15)
            make.centerY.equalTo(passwordTextField)
        }
        
        confirmTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(26)
            make.right.equalToSuperview().offset(-26)
            make.height.equalTo(50)
        }
        
        confirmLabel.snp.makeConstraints { make in
            make.left.equalTo(confirmTextField).offset(15)
            make.centerY.equalTo(confirmTextField)
        }
        
        SingupButton.snp.makeConstraints { make in
            make.top.equalTo(confirmTextField.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(26)
            make.right.equalToSuperview().offset(-26)
            make.height.equalTo(50)
        }
        
        leftLine.snp.makeConstraints { make in
            make.top.equalTo(SingupButton.snp.bottom).offset(45)
            make.left.equalToSuperview().offset(43)
            make.width.equalTo(125)
            make.height.equalTo(1)
        }
        
        OrLabel.snp.makeConstraints { make in
            make.top.equalTo(SingupButton.snp.bottom).offset(33)
            make.centerX.equalToSuperview()
        }
        
        rightLine.snp.makeConstraints { make in
            make.top.equalTo(SingupButton.snp.bottom).offset(45)
            make.right.equalToSuperview().offset(-43)
            make.width.equalTo(125)
            make.height.equalTo(1)
        }
        
        googleButton.snp.makeConstraints { make in
            make.top.equalTo(OrLabel.snp.top).offset(33)
            make.left.equalToSuperview().offset(26)
            make.right.equalToSuperview().offset(-26)
            make.height.equalTo(50)
        }
        
        facebookButton.snp.makeConstraints { make in
            make.top.equalTo(googleButton.snp.bottom).offset(21)
            make.left.equalToSuperview().offset(26)
            make.right.equalToSuperview().offset(-26)
            make.height.equalTo(50)
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupDelegates() {
        emailTextField.delegate = self
        nameTextField.delegate = self
        numberTextField.delegate = self
        passwordTextField.delegate = self
        confirmTextField.delegate = self
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
    
    @objc
    private func SingupTapped() {
        delegate?.didSingupbutton()
    }
}

extension RegisterView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        animateLabel(for: textField)
    }
    
    private func animateLabel(for textField: UITextField) {
        UIView.animate(withDuration: 0.1) {
            var label: UILabel?
            var textFieldFrame: CGRect
            var labelOrigin: CGPoint
            
            switch textField {
            case self.emailTextField:
                label = self.emailLabel
            case self.nameTextField:
                label = self.nameLabel
            case self.numberTextField:
                label = self.numberLabel
            case self.passwordTextField:
                label = self.passwordLabel
            case self.confirmTextField:
                label = self.confirmLabel
            default:
                break
            }
            
            if let label = label {
                textFieldFrame = textField.frame
                labelOrigin = CGPoint(x: textFieldFrame.origin.x + 15,
                                      y: textFieldFrame.minY - label.frame.height / 2)
                label.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                label.frame.origin = labelOrigin
            }
        }
    }
}
