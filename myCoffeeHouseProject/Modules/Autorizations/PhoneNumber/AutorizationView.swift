//
//  AutorizationView.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/2/24.
//

import UIKit
import SnapKit

class AutorizationView: UIView {
    
    private lazy var GeeksImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Image")
        return view
    }()
    
    private lazy var entranceTitle: UILabel = {
        let view = UILabel()
        view.text = "Вход"
        view.tintColor = .black
        view.font = .systemFont(
            ofSize: 34,
            weight: .bold)
        return view
    }()
    
    lazy var numberTextFeild: PaddedTextField = {
        let tf = PaddedTextField()
        tf.placeholder = "+996 999 999 999"
        tf.backgroundColor = .systemGray5
        tf.layer.cornerRadius = 16
        let leftContainerView = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: 35 + 8,
            height: 24))
        let iconImageView = UIImageView(image: UIImage(systemName: "phone"))
        iconImageView.tintColor = .label
        iconImageView.frame = CGRect(
            x: 8,
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
    
    weak var delegate: AutorizationViewControllerDelegate?
    
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
        numberTextFeild.addTarget(
            self, action: #selector(loginButton),
            for: .valueChanged)
        toComeInButton.addTarget(
            self,
            action: #selector(loginButton),
            for: .touchUpInside)
    }
    
    private func setupAdd() {
        addSubview(GeeksImage)
        addSubview(entranceTitle)
        addSubview(numberTextFeild)
        addSubview(toComeInButton)
    }
    
    private func setupConstrains() {
        GeeksImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(103)
            make.right.equalToSuperview().offset(-103)
            make.height.equalTo(150)
        }
        
        entranceTitle.snp.makeConstraints { make in
            make.top.equalTo(GeeksImage.snp.bottom).offset(50)
            make.left.equalToSuperview().offset(16)
        }
        
        numberTextFeild.snp.makeConstraints { make in
            make.top.equalTo(entranceTitle.snp.bottom).offset(32)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }
        
        toComeInButton.snp.makeConstraints { make in
            make.top.equalTo(numberTextFeild.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(50)
            make.bottom.equalToSuperview()
        }
    }
    
    @objc
    private func loginButton() {
        delegate?.didLoginBtn(with: numberTextFeild.text ?? "")
    }
}
