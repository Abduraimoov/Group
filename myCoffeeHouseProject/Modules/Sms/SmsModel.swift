//
//  SmsModel.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/29/24.
//

import UIKit

protocol smsModelDelegate: AnyObject {
    func activeNextField(tag: Int)
    func activePreviosField(tag: Int)
}

class SmsModel: UITextField {
    
    weak var modelDelegate: smsModelDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        backgroundColor = #colorLiteral(red: 0.8374214172, green: 0.8374213576, blue: 0.8374213576, alpha: 1)
        layer.cornerRadius = 10
        tintColor = .clear
        layer.borderColor = UIColor.purple.cgColor
        textColor = .purple
        font = UIFont.boldSystemFont(ofSize: 40)
        textAlignment = .center
    }
    
    override func deleteBackward() {
        
        modelDelegate?.activePreviosField(tag: tag)
    }
}

extension SmsModel: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        text = string
        
        if range.length == 0 {
            modelDelegate?.activeNextField(tag: tag)
            resignFirstResponder()
        }
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        layer.borderWidth = 2
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        layer.borderWidth = 0
    }
}
