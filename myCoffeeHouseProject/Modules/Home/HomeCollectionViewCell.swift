//
//  HomeCollectionViewCell.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/11/24.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    private lazy var leftImage: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
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
        view.font = .systemFont(ofSize: 12,
                                weight: .light)
        view.tintColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var minusButton: UIButton = {
        let view = UIButton(type: .system)
        view.backgroundColor = .systemGray4
        view.setTitle("-",
                      for: .normal)
        view.layer.cornerRadius = 14
        view.titleLabel?.font = .systemFont(ofSize: 25)
        view.tintColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var counterLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16,
                                weight: .bold)
        view.text = "0"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var plusButton: UIButton = {
        let view = UIButton(type: .system)
        view.backgroundColor = UIColor().rgb(r: 255,
                                             g: 139,
                                             b: 91,
                                             alpha: 1)
        view.setTitle("+",
                      for: .normal)
        view.layer.cornerRadius = 14
        view.titleLabel?.font = .systemFont(ofSize: 25)
        view.tintColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstrains()
        plusButton.addTarget(self, action: #selector(incrementCounter), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(decrementCounter), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self?.leftImage.image = image
            }
        }.resume()
    }
    
    private func setupConstrains() {
        addSubview(leftImage)
        addSubview(stackLabels)
        stackLabels.addArrangedSubview(naminglabels)
        stackLabels.addArrangedSubview(drinksLabels)
        contentView.addSubview(minusButton)
        contentView.addSubview(counterLabel)
        contentView.addSubview(plusButton)
        NSLayoutConstraint.activate([
            leftImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            leftImage.leftAnchor.constraint(equalTo: leftAnchor,
                                            constant: 15),
            leftImage.widthAnchor.constraint(equalToConstant: 89),
            leftImage.heightAnchor.constraint(equalToConstant: 89),
            
            stackLabels.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackLabels.leftAnchor.constraint(equalTo: leftImage.leftAnchor,
                                              constant: 100),
            stackLabels.heightAnchor.constraint(equalToConstant: 63),
            stackLabels.widthAnchor.constraint(equalToConstant: 113),
            
            minusButton.topAnchor.constraint(equalTo: topAnchor,
                                             constant: 53),
            minusButton.leftAnchor.constraint(equalTo: stackLabels.leftAnchor,
                                              constant: 171),
            minusButton.heightAnchor.constraint(equalToConstant: 28),
            minusButton.widthAnchor.constraint(equalToConstant: 28),
            
            counterLabel.topAnchor.constraint(equalTo: topAnchor,
                                              constant: 58),
            counterLabel.rightAnchor.constraint(equalTo: rightAnchor,
                                                constant: -58),
            
            plusButton.topAnchor.constraint(equalTo: topAnchor,
                                            constant: 53),
            plusButton.rightAnchor.constraint(equalTo: rightAnchor,
                                              constant: -20),
            plusButton.heightAnchor.constraint(equalToConstant: 28),
            plusButton.widthAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    func setup(product: Product) {
        naminglabels.text = product.strMeal
        drinksLabels.text = product.idMeal
        loadImage(from: product.strMealThumb)
    }
    
    var counter: Int = 0 {
        didSet {
            counterLabel.text = "\(counter)"
        }
    }
    
    @objc private func incrementCounter() {
        counter += 1
    }
    
    @objc private func decrementCounter() {
        counter = max(0,
                      counter - 1)
    }
    
}
