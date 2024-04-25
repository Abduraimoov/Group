//
//  StartingView.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 3/31/24.
//

import UIKit
import SnapKit

class StartignView: UIView {
    
    private lazy var coffeeImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Image")
        return view
    }()
    
    private let welcomeLabel: UILabel = {
        let view = UILabel()
        view.text = "Welcome to Super Foodo"
        view.font = .systemFont(
            ofSize: 24,
            weight: .semibold)
        return view
    }()
    
    private let deckriptionlabel: UILabel = {
        let view = UILabel()
        view.text = "Lorem ipsum dolor sit amet consectetur. Ut cras pellentesque"
        view.font = .systemFont(
            ofSize: 13,
            weight: .regular)
        view.numberOfLines = 2
        view.textAlignment = .center
        return view
    }()
    
    private lazy var registrationbutton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle(
            "Create account",
            for: .normal)
        view.tintColor = .label
        view.backgroundColor = UIColor().rgb(
            r: 251,
            g: 222,
            b: 63,
            alpha: 100)
        view.layer.cornerRadius = 16
        return view
    }()
    
    private lazy var LoginButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Login",
                      for: .normal)
        view.tintColor = .label
        view.layer.cornerRadius = 16
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private let bottomLabel: UILabel = {
        let view = UILabel()
        view.text = "By Registering or Login you have agreed to these Terms and Conditions."
        view.font = .systemFont(
            ofSize: 13,
            weight: .regular)
        view.numberOfLines = 0
        view.textAlignment = .center
        return view
    }()
    
    
    weak var delegate: startingViewControllerDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupAddTarget()
        setupAdd()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAddTarget() {
        registrationbutton.addTarget(
            self,
            action: #selector(RegisterscreensTapped),
            for: .touchUpInside)
        LoginButton.addTarget(
            self,
            action: #selector(ViewControllerTapped),
            for: .touchUpInside)
    }
    
    private func setupAdd() {
        addSubview(coffeeImage)
        addSubview(welcomeLabel)
        addSubview(deckriptionlabel)
        addSubview(registrationbutton)
        addSubview(LoginButton)
        addSubview(bottomLabel)
    }
    
    private func setupConstrains() {
        coffeeImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(33)
            make.right.equalToSuperview().offset(-33)
            make.height.equalTo(327)
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(coffeeImage.snp.bottom).offset(48)
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
        }
        
        deckriptionlabel.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(44)
            make.right.equalToSuperview().offset(-44)
        }
        
        registrationbutton.snp.makeConstraints { make in
            make.top.equalTo(deckriptionlabel.snp.bottom).offset(48)
            make.left.equalToSuperview().offset(26)
            make.right.equalToSuperview().offset(-26)
            make.height.equalTo(50)
        }
        
        LoginButton.snp.makeConstraints { make in
            make.top.equalTo(registrationbutton.snp.bottom).offset(13)
            make.left.equalToSuperview().offset(26)
            make.right.equalToSuperview().offset(-26)
            make.height.equalTo(50)
        }
        
        bottomLabel.snp.makeConstraints { make in
            make.top.equalTo(LoginButton.snp.bottom).offset(48)
            make.horizontalEdges.equalToSuperview().inset(42)
            make.width.equalTo(309)
            make.bottom.equalToSuperview()
        }
        
    }
    
    @objc private func ViewControllerTapped() {
        delegate?.didLoginButton()
    }
    
    @objc private func RegisterscreensTapped() {
        delegate?.didRegisterButton()
    }
}
