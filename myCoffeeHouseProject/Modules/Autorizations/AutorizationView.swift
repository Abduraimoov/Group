//
//  AutorizationView.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/2/24.
//

import UIKit

protocol AutorizationViewDelegate: AnyObject {
    
}

class AutorizationView: UIView {
    
    private lazy var GeeksImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Image")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var entranceTitle: UILabel = {
        let view = UILabel()
        view.text = "Вход"
        view.tintColor = .black
        view.font = .systemFont(ofSize: 34,
                                weight: .bold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var numberTextFeild: UITextField = {
        let tf = UITextField()
        tf.placeholder = "999 999 999"
        tf.backgroundColor = .systemGray5
        tf.layer.cornerRadius = 10
        tf.translatesAutoresizingMaskIntoConstraints = false
        let leftContainerView = UIView(frame: CGRect(x: 0,
                                                     y: 0,
                                                     width: 35 + 8,
                                                     height: 24))
        let iconImageView = UIImageView(image: UIImage(systemName: "phone"))
        iconImageView.tintColor = .label
        iconImageView.frame = CGRect(x: 8,
                                     y: 2,
                                     width: 20,
                                     height: 20)
        leftContainerView.addSubview(iconImageView)
        tf.leftView = leftContainerView
        tf.leftViewMode = .always
        return tf
    }()
    
    private lazy var toComeInButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Войти",
                      for: .normal)
        view.tintColor = .white
        view.layer.cornerRadius = 22
        view.backgroundColor = UIColor().rgb(r: 255,
                                             g: 139,
                                             b: 91,
                                             alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self,
                       action: #selector(homeScreenTransition),
                       for: .touchUpInside)
        return view
    }()
    
    weak var delegate: AutorizationViewDelegate?
    
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
        addSubview(GeeksImage)
        addSubview(entranceTitle)
        addSubview(numberTextFeild)
        addSubview(toComeInButton)
        NSLayoutConstraint.activate([
            GeeksImage.topAnchor.constraint(equalTo: topAnchor,
                                            constant: 155),
            GeeksImage.leftAnchor.constraint(equalTo: leftAnchor,
                                             constant: 103),
            GeeksImage.rightAnchor.constraint(equalTo: rightAnchor,
                                              constant: -103),
            GeeksImage.heightAnchor.constraint(equalToConstant: 80),
            
            entranceTitle.topAnchor.constraint(equalTo: GeeksImage.bottomAnchor,
                                               constant: 60),
            entranceTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            
            numberTextFeild.topAnchor.constraint(equalTo: entranceTitle.bottomAnchor,
                                                 constant: 32),
            numberTextFeild.leftAnchor.constraint(equalTo: leftAnchor,
                                                  constant: 16),
            numberTextFeild.rightAnchor.constraint(equalTo: rightAnchor,
                                                   constant: -16),
            numberTextFeild.heightAnchor.constraint(equalToConstant: 50),
            
            toComeInButton.topAnchor.constraint(equalTo: numberTextFeild.bottomAnchor,
                                                constant: 20),
            toComeInButton.leftAnchor.constraint(equalTo: leftAnchor,
                                                 constant: 16),
            toComeInButton.rightAnchor.constraint(equalTo: rightAnchor,
                                                  constant: -16),
            toComeInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc
    private func homeScreenTransition() {
        screenTransition?()
    }
}
