//
//  OnBoardCell.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/20/24.
//

import UIKit
import SnapKit

class OnBoardCell: UICollectionViewCell {
    
    static var reuseID = "One_Board_cell"
    
    let myImage: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    let myLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 18, weight: .bold)
        return view
    }()
    
    let secondLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 14, weight: .light)
        view.numberOfLines = 0
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupAdd()
        setupConstraints()
    }
    
    private func setupAdd() {
        addSubview(secondLabel)
        addSubview(myLabel)
        addSubview(myImage)
    }
    
    private func setupConstraints() {
        secondLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-370)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
        }
        
        myLabel.snp.makeConstraints { make in
            make.bottom.equalTo(secondLabel.snp.bottom).offset(-60)
            make.centerX.equalToSuperview()
        }
        
        myImage.snp.makeConstraints { make in
            make.bottom.equalTo(myLabel.snp.bottom).offset(-52)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.height.equalTo(250)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with data: structBoarding) {
        myImage.image = UIImage(named: data.image)
        myLabel.text = data.label
        secondLabel.text = data.secondLabel
    }
    
}


