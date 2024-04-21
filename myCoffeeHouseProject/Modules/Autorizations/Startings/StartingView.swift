//
//  StartingView.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 3/31/24.
//

import UIKit

protocol StartingViewDelegate: AnyObject {
    
}

class StartignView: UIView {
    
    private lazy var coffeeImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Image")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let welcomeLabel: UILabel = {
        let view = UILabel()
        view.text = "Welcome to Super Foodo"
        view.font = .systemFont(ofSize: 24,
                                weight: .semibold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let deckriptionlabel: UILabel = {
        let view = UILabel()
        view.text = "Lorem ipsum dolor sit amet consectetur. Ut cras pellentesque"
        view.font = .systemFont(ofSize: 13,
                                weight: .regular)
        view.numberOfLines = 2
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var registrationbutton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Create account",
                      for: .normal)
        view.tintColor = .label
        view.backgroundColor = UIColor().rgb(r: 251,
                                             g: 222,
                                             b: 63,
                                             alpha: 100)
        view.layer.cornerRadius = 26
        view.addTarget(self,
                       action: #selector(RegisterscreensTapped),
                       for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var LoginButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Login",
                      for: .normal)
        view.tintColor = .label
        view.layer.cornerRadius = 26
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self,
                       action: #selector(ViewControllerTapped),
                       for: .touchUpInside)
        return view
    }()
    
    private let bottomLabel: UILabel = {
        let view = UILabel()
        view.text = "By Registering or Login you have agreed to these Terms and Conditions."
        view.font = .systemFont(ofSize: 13,
                                weight: .regular)
        view.numberOfLines = 2
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    weak var delegate: StartingViewDelegate?
    
    var screenTransitionTapped: (() -> Void)?
    
    var registerScreen: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstrains() {
        addSubview(coffeeImage)
        addSubview(welcomeLabel)
        addSubview(deckriptionlabel)
        addSubview(registrationbutton)
        addSubview(LoginButton)
        addSubview(bottomLabel)
        NSLayoutConstraint.activate([
            coffeeImage.topAnchor.constraint(equalTo: topAnchor,
                                             constant: 85),
            coffeeImage.leftAnchor.constraint(equalTo: leftAnchor,
                                              constant: 33),
            coffeeImage.rightAnchor.constraint(equalTo: rightAnchor,
                                               constant: -33),
            coffeeImage.heightAnchor.constraint(equalToConstant: 327),
            
            welcomeLabel.topAnchor.constraint(equalTo: coffeeImage.bottomAnchor,
                                              constant: 48),
            welcomeLabel.leftAnchor.constraint(equalTo: leftAnchor,
                                               constant: 50),
            welcomeLabel.rightAnchor.constraint(equalTo: rightAnchor,
                                                constant: -50),
            
            deckriptionlabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor,
                                                  constant: 12),
            deckriptionlabel.leftAnchor.constraint(equalTo: leftAnchor,
                                                   constant: 44),
            deckriptionlabel.rightAnchor.constraint(equalTo: rightAnchor,
                                                    constant: -44),
            
            registrationbutton.topAnchor.constraint(equalTo: deckriptionlabel.bottomAnchor,
                                                    constant: 48),
            registrationbutton.leftAnchor.constraint(equalTo: leftAnchor,
                                                     constant: 26),
            registrationbutton.rightAnchor.constraint(equalTo: rightAnchor,
                                                      constant: -26),
            registrationbutton.heightAnchor.constraint(equalToConstant: 50),
            
            LoginButton.topAnchor.constraint(equalTo: registrationbutton.bottomAnchor,
                                             constant: 13),
            LoginButton.leftAnchor.constraint(equalTo: leftAnchor,
                                              constant: 26),
            LoginButton.rightAnchor.constraint(equalTo: rightAnchor,
                                               constant: -26),
            LoginButton.heightAnchor.constraint(equalToConstant: 50),
            
            bottomLabel.topAnchor.constraint(equalTo: LoginButton.bottomAnchor,
                                             constant: 48),
            bottomLabel.leftAnchor.constraint(equalTo: leftAnchor,
                                              constant: 42),
            bottomLabel.rightAnchor.constraint(equalTo: rightAnchor,
                                               constant: -42),
            bottomLabel.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                constant: -48)
        ])
    }
    
    @objc private func ViewControllerTapped() {
        screenTransitionTapped?()
    }
    
    @objc private func RegisterscreensTapped() {
        registerScreen?()
    }
}
