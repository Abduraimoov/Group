//
//  SmsView.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/11/24.
//

import UIKit
import SnapKit

class SmsView: UIView {
    
   private lazy var coffeeImage: UIImageView = {
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
    
    private let fieldStack: UIStackView = {
        let view = UIStackView()
        view.spacing = 5
        view.distribution = .fillEqually
        return view
    }()
    
    var verifyFields = [SmsModel]()
    
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
        setupAdd()
        setupConstrains()
        setupAddTardet()
        verifyTextFieldConfigiration()
        verifyFields[0].becomeFirstResponder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    private func setupAdd() {
        addSubview(coffeeImage)
        addSubview(smsTitle)
        addSubview(fieldStack)
        addSubview(nextButton)
    }
    
    private func setupConstrains() {
        coffeeImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(102)
            make.height.equalTo(150)
        }
        
        smsTitle.snp.makeConstraints { make in
            make.top.equalTo(coffeeImage.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(16)
        }
        
        fieldStack.snp.makeConstraints { make in
            make.top.equalTo(smsTitle.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(55)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(fieldStack.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(50)
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupAddTardet() {
        nextButton.addTarget(
            self,
            action: #selector(nextTapped),
            for: .touchUpInside)
    }
    
    private func verifyTextFieldConfigiration() {
        
        for number in 0...5 {
            let verifytextField = SmsModel()
            verifytextField.tag = number
            verifytextField.modelDelegate = self
            verifyFields.append(verifytextField)
            fieldStack.addArrangedSubview(verifytextField)
        }
    }
    
    func getFieldCode() -> String {
        var fieldsCode = ""
        verifyFields.forEach {
            fieldsCode.append($0.text ?? "")
        }
        return fieldsCode
    }
    
    @objc private func nextTapped() {
        delegate?.didLoginButton()
    }
}

extension SmsView: smsModelDelegate {
    func activeNextField(tag: Int) {
        if tag != verifyFields.count - 1 {
            verifyFields[tag + 1].becomeFirstResponder()
        } else {

        }
    }
    
    func activePreviosField(tag: Int) {
        if tag != 0 {
            verifyFields[tag - 1].text = ""
            verifyFields[tag - 1].becomeFirstResponder()
        }
    }
}
