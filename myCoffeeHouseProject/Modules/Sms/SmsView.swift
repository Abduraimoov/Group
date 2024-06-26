//
//  SmsView.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/11/24.
//

import UIKit

protocol SmsViewDelegate: AnyObject {
    
}

class SmsView: UIView {
    
    lazy var coffeeImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Image")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var smsTitle: UILabel = {
        let view = UILabel()
        view.text = "Sms код"
        view.tintColor = .black
        view.font = .systemFont(ofSize: 24,
                                weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var numberTextFeild: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter a sms code"
        tf.backgroundColor = .systemGray5
        tf.layer.cornerRadius = 16
        tf.translatesAutoresizingMaskIntoConstraints = false
        let leftContainerView = UIView(frame: CGRect(x: 0,
                                                     y: 0,
                                                     width: 35 + 8,
                                                     height: 24))
        return tf
    }()
    
    private lazy var nextButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Войти",
                      for: .normal)
        view.tintColor = .white
        view.layer.cornerRadius = 16
        view.backgroundColor = UIColor().rgb(r: 255,
                                             g: 139,
                                             b: 91,
                                             alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self,
                       action: #selector(nextTapped),
                       for: .touchUpInside)
        return view
    }()
    
    
    weak var delegate: SmsViewDelegate?
    
    var screenTransition: (() -> Void)?
    
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
        addSubview(smsTitle)
        addSubview(nextButton)
        addSubview(numberTextFeild)
        NSLayoutConstraint.activate([
        
            coffeeImage.topAnchor.constraint(equalTo: topAnchor,
                                             constant: 234),
            coffeeImage.leftAnchor.constraint(equalTo: leftAnchor,
                                              constant: 102),
            coffeeImage.rightAnchor.constraint(equalTo: rightAnchor,
                                               constant: -102),
            coffeeImage.heightAnchor.constraint(equalToConstant: 80),
            
            smsTitle.topAnchor.constraint(equalTo: coffeeImage.bottomAnchor,
                                               constant: 40),
            smsTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            
            numberTextFeild.topAnchor.constraint(equalTo: smsTitle.bottomAnchor,
                                                 constant: 20),
            numberTextFeild.leftAnchor.constraint(equalTo: leftAnchor,
                                                  constant: 16),
            numberTextFeild.rightAnchor.constraint(equalTo: rightAnchor,
                                                   constant: -16),
            numberTextFeild.heightAnchor.constraint(equalToConstant: 50),
            
            nextButton.topAnchor.constraint(equalTo: smsTitle.bottomAnchor,
                                                constant: 90),
            nextButton.leftAnchor.constraint(equalTo: leftAnchor,
                                                 constant: 16),
            nextButton.rightAnchor.constraint(equalTo: rightAnchor,
                                                  constant: -16),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func nextTapped() {
        screenTransition?()
    }
    
}
