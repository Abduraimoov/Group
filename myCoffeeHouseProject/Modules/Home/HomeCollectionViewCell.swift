//
//  HomeCollectionViewCell.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/2/24.
//

import UIKit

struct Elements {
    var image: String
    var naming: String
    var drink: String
    var Money: String
    var minus: String
    var counter: String
    var plus: String
}


class HomeCollectionViewCell: UICollectionViewCell {
    
    private lazy var leftImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackLabels: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .leading
        view.spacing = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var naminglabels: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16,
                                weight: .light)
        view.tintColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var drinksLabels: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16, 
                                weight: .light)
        view.tintColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var moneyLabels: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16, 
                                weight: .light)
        view.tintColor = UIColor().rgb(r: 255, g: 139, b: 91, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var minusButton: UIButton = {
        let view = UIButton(type: .system)
        view.backgroundColor = .systemGray4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var counterLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16,
                                weight: .bold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var plusButton: UIButton = {
        let view = UIButton(type: .system)
        view.backgroundColor = UIColor().rgb(r: 255, g: 139, b: 91, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstrains() {
        addSubview(leftImage)
        addSubview(stackLabels)
        stackLabels.addArrangedSubview(naminglabels)
        stackLabels.addArrangedSubview(drinksLabels)
        stackLabels.addArrangedSubview(moneyLabels)
        addSubview(minusButton)
        addSubview(counterLabel)
        addSubview(plusButton)
        NSLayoutConstraint.activate([
            leftImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            leftImage.leftAnchor.constraint(equalTo: leftAnchor),
            leftImage.widthAnchor.constraint(equalToConstant: 89),
            leftImage.heightAnchor.constraint(equalToConstant: 89),
            
            stackLabels.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackLabels.leftAnchor.constraint(equalTo: leftImage.leftAnchor,
                                              constant: 16),
            stackLabels.heightAnchor.constraint(equalToConstant: 63),
            stackLabels.widthAnchor.constraint(equalToConstant: 113),
            
            minusButton.topAnchor.constraint(equalTo: topAnchor,
                                             constant: 53),
            minusButton.leftAnchor.constraint(equalTo: stackLabels.leftAnchor,
                                              constant: 31),
            minusButton.heightAnchor.constraint(equalToConstant: 28),
            minusButton.widthAnchor.constraint(equalToConstant: 28),
            
            
            counterLabel.topAnchor.constraint(equalTo: topAnchor,
                                              constant: 53),
            counterLabel.leftAnchor.constraint(equalTo: minusButton.leftAnchor,
                                               constant: 13),
            
            plusButton.topAnchor.constraint(equalTo: topAnchor,
                                            constant: 53),
            plusButton.rightAnchor.constraint(equalTo: rightAnchor),
            plusButton.heightAnchor.constraint(equalToConstant: 28),
            plusButton.widthAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    func configure(with element: Elements) {
        leftImage.image = UIImage(named: element.image)
        naminglabels.text = element.naming
        drinksLabels.text = element.drink
        moneyLabels.text = element.Money
        minusButton.setTitle(element.minus,
                             for: .normal)
        counterLabel.text = element.counter
        plusButton.setTitle(element.plus,
                            for: .normal)
    }
}

