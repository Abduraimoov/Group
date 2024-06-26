//
//  ForgotPasswordView.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/21/24.
//

import UIKit
import SnapKit

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
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self,
                       action: #selector(ScreenTapped),
                       for: .touchUpInside)
        return view
    }()
    
    weak var delegate: ForgotPasswordViewControllerDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupAddSubview()
        setupConstraints()
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
    
    func setupConstraints() {
        passwordLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(43)
        }
        
        deckriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(18)
            make.left.equalToSuperview().offset(27)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(deckriptionLabel.snp.bottom).offset(81)
            make.left.equalToSuperview().offset(26)
            make.right.equalToSuperview().offset(-26)
            make.height.equalTo(50)
        }
        
        stackLabels.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(26)
            make.left.equalToSuperview().offset(76)
            make.right.equalToSuperview().offset(-122)
            make.height.equalTo(20)
        }
        
        sumbitButton.snp.makeConstraints { make in
            make.top.equalTo(stackLabels.snp.bottom).offset(247)
            make.left.equalToSuperview().offset(26)
            make.right.equalToSuperview().offset(-26)
            make.height.equalTo(50)
            make.bottom.equalToSuperview()
        }
    }
    
    @objc private func ScreenTapped() {
        delegate?.didsumbitButton()
    }
    
    @objc private func loginScreen() {
        delegate?.didLoginButton()
    }
}
