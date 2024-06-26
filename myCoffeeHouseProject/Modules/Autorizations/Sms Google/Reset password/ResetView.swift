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
        view.font = .systemFont(ofSize: 24,
                                weight: .semibold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let deckriptionLabel: UILabel = {
        let view = UILabel()
        view.text = "Enter your password below"
        view.font = .systemFont(ofSize: 13,
                                weight: .regular)
        view.tintColor = .label
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
        view.layer.borderColor = UIColor.label.cgColor
        view.layer.borderWidth = 1
        let rightView = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        rightView.setBackgroundImage(UIImage(systemName: "eye.slash"), for: .normal)
        rightView.tintColor = .label
        rightView.tag = 1
        view.rightView = rightView
        view.rightViewMode = .always
        view.tag = 1
        return view
    }()
    
    private let ResetPasswordButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Reset password",
                      for: .normal)
        view.tintColor = .black
        view.backgroundColor = UIColor().rgb(r: 251,
                                             g: 222,
                                             b: 63,
                                             alpha: 100)
        view.layer.cornerRadius = 16
        view.addTarget(self,
                       action: #selector(transilation),
                       for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    weak var delegate: ResetViewControllerDelegate?
    
    var screenTransilation: (()-> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAddSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAddSubviews() {
        addSubview(resetLabel)
        addSubview(deckriptionLabel)
        addSubview(passwordTextField)
        addSubview(confirmTextField)
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
        
        confirmTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(25)
            make.left.equalToSuperview().offset(26)
            make.right.equalToSuperview().offset(-26)
            make.height.equalTo(50)
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
}
