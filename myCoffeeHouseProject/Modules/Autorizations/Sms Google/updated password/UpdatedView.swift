//
//  UpdatedView.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/21/24.
//

import UIKit
import SnapKit

class UpdatedView: UIView {
    
    private let emailIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Updateed")
        return view
    }()
    
    private let emaillabel: UILabel = {
        let view = UILabel()
        view.text = "Password updated"
        view.font = .systemFont(
            ofSize: 24,
            weight: .semibold)
        return view
    }()
    
    private let deckriptionlabel: UILabel = {
        let view = UILabel()
        view.text = "Congratulation your password has been updated"
        view.font = .systemFont(
            ofSize: 13,
            weight: .regular)
        view.numberOfLines = 2
        view.textAlignment = .center
        view.tintColor = .label
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
            alpha: 100)
        view.layer.cornerRadius = 26
        return view
    }()
    
    weak var delegate: UpdatedViewControllerDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAddTarget()
        setupAddSubview()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAddTarget() {
        ContinueButton.addTarget(
            self,
            action: #selector(transilation),
            for: .touchUpInside)
    }
    
    private func setupAddSubview() {
        addSubview(emailIcon)
        addSubview(emaillabel)
        addSubview(deckriptionlabel)
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
        
        ContinueButton.snp.makeConstraints { make in
            make.top.equalTo(deckriptionlabel.snp.top).offset(250)
            make.left.equalToSuperview().offset(26)
            make.right.equalToSuperview().offset(-26)
            make.height.equalTo(50)
            make.bottom.equalToSuperview()
        }
    }
    @objc private func transilation() {
        delegate?.didContinueButton()
    }
}
