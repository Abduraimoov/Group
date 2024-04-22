//
//  CheckEmailView.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/21/24.
//

import UIKit

protocol CheckEmailViewDelegate: AnyObject {
    
}

class CheckEmailView: UIView {
    
    private let emailIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "emailImage")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let emaillabel: UILabel = {
        let view = UILabel()
        view.text = "Check email"
        view.font = .systemFont(ofSize: 24,
                                weight: .semibold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let deckriptionlabel: UILabel = {
        let view = UILabel()
        view.text = "Please check your email to create a new password"
        view.font = .systemFont(ofSize: 13,
                                weight: .regular)
        view.numberOfLines = 2
        view.textAlignment = .center
        view.tintColor = .label
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let stackLabels: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let receivedLabel: UILabel = {
        let view = UILabel()
        view.text = "Email not received?"
        view.font = .systemFont(ofSize: 13,
                                weight: .regular)
        view.tintColor = .label
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let resubmitButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Resubmit",
                      for: .normal)
        view.setTitleColor(.label,
                           for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 13,
                                                  weight: .semibold)
        view.addTarget(self,
                       action: #selector(popToView),
                       for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let ContinueButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Continue",
                      for: .normal)
        view.tintColor = .black
        view.backgroundColor = UIColor().rgb(r: 251,
                                             g: 222,
                                             b: 63,
                                             alpha: 100)
        view.layer.cornerRadius = 26
        view.addTarget(self,
                       action: #selector(resetScreen),
                       for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    weak var delegate: CheckEmailViewDelegate?
    
    var resetScreenTransilation: (()-> Void)?
    
    var popToViewTransilation: (()-> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAddSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAddSubview() {
        addSubview(emailIcon)
        addSubview(emaillabel)
        addSubview(deckriptionlabel)
        addSubview(stackLabels)
        stackLabels.addArrangedSubview(receivedLabel)
        stackLabels.addArrangedSubview(resubmitButton)
        addSubview(ContinueButton)
        NSLayoutConstraint.activate([
            emailIcon.topAnchor.constraint(equalTo: topAnchor,
                                           constant: 160),
            emailIcon.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailIcon.heightAnchor.constraint(equalToConstant: 81),
            emailIcon.widthAnchor.constraint(equalToConstant: 81),
            
            emaillabel.topAnchor.constraint(equalTo: emailIcon.bottomAnchor,
                                            constant: 24),
            emaillabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            deckriptionlabel.topAnchor.constraint(equalTo: emaillabel.bottomAnchor,
                                                  constant: 16),
            deckriptionlabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            deckriptionlabel.widthAnchor.constraint(equalToConstant: 240),
            
            stackLabels.topAnchor.constraint(equalTo: deckriptionlabel.bottomAnchor,
                                             constant: 32),
            stackLabels.leftAnchor.constraint(equalTo: leftAnchor,
                                              constant: 106),
            stackLabels.rightAnchor.constraint(equalTo: rightAnchor,
                                               constant: -106),
            stackLabels.heightAnchor.constraint(equalToConstant: 20),
            
            ContinueButton.topAnchor.constraint(equalTo: stackLabels.topAnchor, constant: 205),
            ContinueButton.leftAnchor.constraint(equalTo: leftAnchor,
                                                 constant: 26),
            ContinueButton.rightAnchor.constraint(equalTo: rightAnchor,
                                                  constant: -26),
            ContinueButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func resetScreen() {
        resetScreenTransilation?()
    }
    
    @objc private func popToView() {
        popToViewTransilation?()
    }
}
