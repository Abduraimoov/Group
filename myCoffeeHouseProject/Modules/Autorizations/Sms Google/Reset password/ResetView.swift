//
//  ResetView.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/21/24.
//

import UIKit

class ResetView: UIView {
    
    let resetLabel: UILabel = {
        let view = UILabel()
        view.text = "Reset your password"
        view.tintColor = .label
        view.font = .systemFont(ofSize: 24,
                                weight: .semibold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let deckriptionLabel: UILabel = {
        let view = UILabel()
        view.text = "Enter your password below"
        view.font = .systemFont(ofSize: 13,
                                weight: .regular)
        view.tintColor = .label
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
     let passwordTextField: PaddedTextField = {
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
        //rightView.addTarget(self, action: #selector(hideText), for: .touchUpInside)
        rightView.tag = 1
        view.rightView = rightView
        view.rightViewMode = .always
        view.tag = 1
        return view
    }()
    
     let confirmTextField: PaddedTextField = {
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
     //   rightView.addTarget(self, action: #selector(hideText), for: .touchUpInside)
        rightView.tag = 1
        view.rightView = rightView
        view.rightViewMode = .always
        view.tag = 1
        return view
    }()
    
    let ResetPasswordButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Reset password",
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAddSubviews()
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
    
}
