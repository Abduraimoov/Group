//
//  ResetView.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/21/24.
//

import UIKit
import SnapKit

class ResetView: UIView {
    
    private let resetLabel: UILabel = {
        let view = UILabel()
        view.text = "Reset your password"
        view.tintColor = .label
        view.font = .systemFont(
            ofSize: 24,
            weight: .semibold)
        return view
    }()
    
    private let deckriptionLabel: UILabel = {
        let view = UILabel()
        view.text = "Enter your password below"
        view.font = .systemFont(
            ofSize: 13,
            weight: .regular)
        view.tintColor = .label
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
        rightView.tintColor = .black
        rightView.tag = 1
        view.rightView = rightView
        view.rightViewMode = .always
        view.tag = 1
        return view
    }()
    
    private let passwordlabel: UILabel = {
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
    
    private let confirmlabel: UILabel = {
        let view = UILabel()
        view.tintColor = .systemGray5
        view.text = " confirm password "
        view.font = .systemFont(
            ofSize: 16,
            weight: .regular)
        view.backgroundColor = .white
        return view
    }()
    
    private let ResetPasswordButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Reset password",
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
    
    weak var delegate: ResetViewControllerDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAddTarget()
        setupAddSubviews()
        setupConstraints()
        setupDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAddTarget() {
        ResetPasswordButton.addTarget(
            self,
            action: #selector(transilation),
            for: .touchUpInside)
    }
    
    private func setupAddSubviews() {
        addSubview(resetLabel)
        addSubview(deckriptionLabel)
        addSubview(passwordTextField)
        addSubview(passwordlabel)
        addSubview(confirmTextField)
        addSubview(confirmlabel)
        addSubview(ResetPasswordButton)
    }
    
    private func setupConstraints() {
        resetLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(43)
        }
        
        deckriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(resetLabel.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(37)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(deckriptionLabel.snp.bottom).offset(84)
            make.left.equalToSuperview().offset(26)
            make.right.equalToSuperview().offset(-26)
            make.height.equalTo(50)
        }
        
        passwordlabel.snp.makeConstraints { make in
            make.left.equalTo(passwordTextField).offset(15)
            make.centerY.equalTo(passwordTextField)
        }
        
        confirmTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(25)
            make.left.equalToSuperview().offset(26)
            make.right.equalToSuperview().offset(-26)
            make.height.equalTo(50)
        }
        
        confirmlabel.snp.makeConstraints { make in
            make.left.equalTo(confirmTextField).offset(15)
            make.centerY.equalTo(confirmTextField)
        }
        
        ResetPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(confirmTextField.snp.bottom).offset(226)
            make.left.equalToSuperview().offset(26)
            make.right.equalToSuperview().offset(-26)
            make.height.equalTo(50)
            make.bottom.equalToSuperview()
        }
    }
    
    @objc private func transilation() {
        delegate?.didResetButton()
    }
    
    private func setupDelegates() {
        passwordTextField.delegate = self
        confirmTextField.delegate = self
    }
}

extension ResetView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        animateLabel(for: textField)
    }
    
    private func animateLabel(for textField: UITextField) {
        UIView.animate(withDuration: 0.1) {
            var label: UILabel?
            var textFieldFrame: CGRect
            var labelOrigin: CGPoint
            
            switch textField {
            case self.passwordTextField:
                label = self.passwordlabel
            case self.confirmTextField:
                label = self.confirmlabel
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
