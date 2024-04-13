//
//  SmsView.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/11/24.
//

import UIKit

class SmsView: UIView {
    
    lazy var coffeeImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Image")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
