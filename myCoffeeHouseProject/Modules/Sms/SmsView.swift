//
//  SmsView.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/11/24.
//

import UIKit
import SnapKit

class SmsView: UIView {
    
    lazy var coffeeImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Image")
        return view
    }()
    
    private lazy var smsTitle: UILabel = {
        let view = UILabel()
        view.text = "Sms код"
        view.tintColor = .black
        view.font = .systemFont(
            ofSize: 24,
            weight: .medium)
        return view
    }()
    
    private lazy var numberTextFeild: PaddedTextField = {
        let tf = PaddedTextField()
        tf.placeholder = "Enter a sms code"
        tf.backgroundColor = .systemGray5
        tf.layer.cornerRadius = 16
        let leftContainerView = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: 35 + 8,
            height: 24))
        return tf
    }()
    
    private lazy var nextButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle(
            "Войти",
            for: .normal)
        view.tintColor = .white
        view.layer.cornerRadius = 16
        view.backgroundColor = UIColor().rgb(
            r: 255,
            g: 139,
            b: 91,
            alpha: 1)
        return view
    }()
    
    
    weak var delegate: SmsViewControllerDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupAddTardet()
        setupAdd()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAddTardet() {
        nextButton.addTarget(
            self,
            action: #selector(nextTapped),
            for: .touchUpInside)
    }
    
    private func setupAdd() {
        addSubview(coffeeImage)
        addSubview(smsTitle)
        addSubview(nextButton)
        addSubview(numberTextFeild)
    }
    
    private func setupConstrains() {
        coffeeImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(102)
            make.right.equalToSuperview().offset(-102)
            make.height.equalTo(150)
        }
        
        smsTitle.snp.makeConstraints { make in
            make.top.equalTo(coffeeImage.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(16)
        }
        
        numberTextFeild.snp.makeConstraints { make in
            make.top.equalTo(smsTitle.snp.bottom).offset(25)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(numberTextFeild.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(50)
            make.bottom.equalToSuperview()
        }
        
    }
    
    @objc private func nextTapped() {
        delegate?.didLoginButton()
    }
    
}
