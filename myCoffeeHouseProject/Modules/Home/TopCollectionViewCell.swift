//
//  TopCollectionViewCell.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/5/24.
//

import UIKit

class TopCollectionViewCell: UICollectionViewCell {
    
    private lazy var listlabels: UILabel = {
        let view = UILabel()
        view.tintColor = .systemGray3
        view.font = .systemFont(ofSize: 16.5)
        view.translatesAutoresizingMaskIntoConstraints = false
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
        NSLayoutConstraint.activate([
            listlabels.topAnchor.constraint(equalTo: topAnchor,
                                            constant: 5),
        listlabels.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func configure(list: labels) {
        listlabels.text = list.label
    }
}
