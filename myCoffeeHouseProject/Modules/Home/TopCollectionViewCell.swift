//
//  TopCollectionViewCell.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/11/24.
//

import UIKit
import SnapKit

class TopCollectionViewCell: UICollectionViewCell {
    
    private lazy var listlabels: UILabel = {
        let view = UILabel()
        view.tintColor = .systemGray3
        view.font = .systemFont(ofSize: 16.5)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstrains() {
        addSubview(listlabels)
        listlabels.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.centerX.equalToSuperview()
        }
    }
    
    func configure(list: Category) {
        listlabels.text = list.title
    }
}
