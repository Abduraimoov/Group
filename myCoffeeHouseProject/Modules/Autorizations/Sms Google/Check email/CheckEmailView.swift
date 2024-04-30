//
//  CheckEmailView.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/21/24.
//

import UIKit
import SnapKit

class CheckEmailView: UIView {
    
    private let emailIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "emailImage")
        return view
    }()
    
    private let emaillabel: UILabel = {
        let view = UILabel()
        view.text = "Check email"
        view.font = .systemFont(
            ofSize: 24,
            weight: .semibold)
        return view
    }()
    
    private let deckriptionlabel: UILabel = {
        let view = UILabel()
        view.text = "Please check your email to create a new password"
        view.font = .systemFont(
            ofSize: 13,
            weight: .regular)
        view.numberOfLines = 2
        view.textAlignment = .center
        view.tintColor = .label
        return view
    }()
    
    private let stackLabels: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        return view
    }()
    
    private let receivedLabel: UILabel = {
        let view = UILabel()
        view.text = "Email not received?"
        view.font = .systemFont(
            ofSize: 13,
            weight: .regular)
        view.tintColor = .label
        return view
    }()
    
    private let resubmitButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle(
            "Resubmit",
            for: .normal)
        view.setTitleColor(
            .label,
            for: .normal)
        view.titleLabel?.font = UIFont.systemFont(
            ofSize: 13,
            weight: .semibold)
        return view
    }()
    
    private let ContinueButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle(
            "Continue",
            for: .normal)
        view.tintColor = .black
        view.backgroundColor = UIColor().rgb(
            r: 251,
            g: 222,
            b: 63,
            alpha: 100
        )
        view.layer.cornerRadius = 16
        return view
    }()
    
    weak var delegate: CheckEmailViewControllerDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAddTarger()
        setupAddSubview()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAddTarger() {
        resubmitButton.addTarget(
            self,
            action: #selector(popToView),
            for: .touchUpInside)
        ContinueButton.addTarget(self,
                                 action: #selector(resetScreen),
                                 for: .touchUpInside)
    }
    
    private func setupAddSubview() {
        addSubview(emailIcon)
        addSubview(emaillabel)
        addSubview(deckriptionlabel)
        addSubview(stackLabels)
        stackLabels.addArrangedSubview(receivedLabel)
        stackLabels.addArrangedSubview(resubmitButton)
        addSubview(ContinueButton)
    }
    
    private func setupConstraints() {
        emailIcon.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.height.equalTo(81)
        }
        
        emaillabel.snp.makeConstraints { make in
            make.top.equalTo(emailIcon.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
        }
        
        deckriptionlabel.snp.makeConstraints { make in
            make.top.equalTo(emaillabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(240)
        }
        
        stackLabels.snp.makeConstraints { make in
            make.top.equalTo(deckriptionlabel.snp.bottom).offset(32)
            make.left.equalToSuperview().offset(106)
            make.right.equalToSuperview().offset(-106)
            make.height.equalTo(20)
        }
        
        ContinueButton.snp.makeConstraints { make in
            make.top.equalTo(stackLabels.snp.top).offset(205)
            make.left.equalToSuperview().offset(26)
            make.right.equalToSuperview().offset(-26)
            make.height.equalTo(50)
            make.bottom.equalToSuperview()
        }
    }
    
    @objc private func resetScreen() {
        delegate?.didContinueButton()
    }
    
    @objc private func popToView() {
        delegate?.didResumbitButton()
    }
}
