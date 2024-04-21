//
//  CheckEmailView.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/21/24.
//

import UIKit

class CheckEmailView: UIView {
    
     let emailIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "emailImage")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emaillabel: UILabel = {
        let view = UILabel()
        view.text = "Check email"
        view.font = .systemFont(ofSize: 24,
                                weight: .semibold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let deckriptionlabel: UILabel = {
        let view = UILabel()
        view.text = "Please check your email to create a new password"
        view.font = .systemFont(ofSize: 13,
                                weight: .regular)
        view.numberOfLines = 2
        view.textAlignment = .center
        view.tintColor = .label
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let stackLabels: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let receivedLabel: UILabel = {
        let view = UILabel()
        view.text = "Email not received?"
        view.font = .systemFont(ofSize: 13,
                                weight: .regular)
        view.tintColor = .label
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let resubmitButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Resubmit",
                      for: .normal)
        view.setTitleColor(.label,
                           for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 13,
                                                  weight: .semibold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let ContinueButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Continue",
                      for: .normal)
        view.tintColor = .black
        view.backgroundColor = UIColor().rgb(r: 251,
                                             g: 222,
                                             b: 63,
                                             alpha: 100)
        view.layer.cornerRadius = 26
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAddSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

}
