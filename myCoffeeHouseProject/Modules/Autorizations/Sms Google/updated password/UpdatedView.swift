//
//  UpdatedView.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/21/24.
//

import UIKit

class UpdatedView: UIView {
    
    let emailIcon: UIImageView = {
       let view = UIImageView()
       view.image = UIImage(named: "Updateed")
       view.translatesAutoresizingMaskIntoConstraints = false
       return view
   }()
   
   let emaillabel: UILabel = {
       let view = UILabel()
       view.text = "Password updated"
       view.font = .systemFont(ofSize: 24,
                               weight: .semibold)
       view.translatesAutoresizingMaskIntoConstraints = false
       return view
   }()
   
   let deckriptionlabel: UILabel = {
       let view = UILabel()
       view.text = "Congratulation your password has been updated"
       view.font = .systemFont(ofSize: 13,
                               weight: .regular)
       view.numberOfLines = 2
       view.textAlignment = .center
       view.tintColor = .label
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
       addSubview(ContinueButton)
   }

}

