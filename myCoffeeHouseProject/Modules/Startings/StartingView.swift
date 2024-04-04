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
    
    lazy var coffeeImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Image")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var toComeInButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Войти", for: .normal)
        view.tintColor = .white
        view.layer.cornerRadius = 22
        view.backgroundColor = UIColor().rgb(r: 255, g: 139, b: 91, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self,
                       action: #selector(ViewControllerTapped),
                       for: .touchUpInside)
        return view
    }()
    
    lazy var registrationbutton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Регистрация", for: .normal)
        view.tintColor = .systemGray4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    weak var delegate: StartingViewDelegate?
    
    var screenTransitionTapped: (() -> Void)?
    
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
        addSubview(toComeInButton)
        addSubview(registrationbutton)
        NSLayoutConstraint.activate([
            coffeeImage.topAnchor.constraint(equalTo: topAnchor,
                                             constant: 234),
            coffeeImage.leftAnchor.constraint(equalTo: leftAnchor,
                                              constant: 102),
            coffeeImage.rightAnchor.constraint(equalTo: rightAnchor,
                                               constant: -102),
            coffeeImage.heightAnchor.constraint(equalToConstant: 80),
            
            toComeInButton.topAnchor.constraint(equalTo: coffeeImage.bottomAnchor,
                                                constant: 98),
            toComeInButton.leftAnchor.constraint(equalTo: leftAnchor,
                                                 constant: 15),
            toComeInButton.rightAnchor.constraint(equalTo: rightAnchor,
                                                  constant: -15),
            toComeInButton.heightAnchor.constraint(equalToConstant: 50),
            
            registrationbutton.topAnchor.constraint(equalTo: toComeInButton.bottomAnchor,
                                                    constant: 16),
            registrationbutton.leftAnchor.constraint(equalTo: leftAnchor,
                                                     constant: 16),
            registrationbutton.rightAnchor.constraint(equalTo: rightAnchor,
                                                      constant: -16),
            registrationbutton.heightAnchor.constraint(equalToConstant: 50)
        ])
    
    }
    
    @objc
    func ViewControllerTapped() {
        screenTransitionTapped?()
    }
    
}
