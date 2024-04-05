//
//  TopCollectionViewCell.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/5/24.
//

import UIKit

struct labels {
    var label: String
}

class TopCollectionViewCell: UICollectionViewCell {
    
    private lazy var listlabels: UILabel = {
        let view = UILabel()
        view.tintColor = .systemGray3
        view.font = .systemFont(ofSize: 17)
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
        listlabels.centerYAnchor.constraint(equalTo: centerYAnchor),
        listlabels.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func configure(list: labels) {
        listlabels.text = list.label
    }
}
