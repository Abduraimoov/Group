//
//  HomeCollectionViewCell.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/11/24.
//

import UIKit
import SnapKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    private lazy var leftImage: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var stackLabels: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .leading
        view.spacing = 1
        return view
    }()
    
    private lazy var naminglabels: UILabel = {
        let view = UILabel()
        view.font = .systemFont(
            ofSize: 16,
            weight: .light)
        view.tintColor = .black
        return view
    }()
    
    private lazy var drinksLabels: UILabel = {
        let view = UILabel()
        view.font = .systemFont(
            ofSize: 12,
            weight: .light)
        view.tintColor = .black
        return view
    }()
    
    private lazy var minusButton: UIButton = {
        let view = UIButton(type: .system)
        view.backgroundColor = .systemGray4
        view.setTitle(
            "-",
            for: .normal)
        view.layer.cornerRadius = 14
        view.titleLabel?.font = .systemFont(ofSize: 25)
        view.tintColor = .black
        return view
    }()
    
    private lazy var counterLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(
            ofSize: 16,
            weight: .bold)
        view.text = "0"
        return view
    }()
    
    private lazy var plusButton: UIButton = {
        let view = UIButton(type: .system)
        view.backgroundColor = UIColor().rgb(
            r: 255,
            g: 139,
            b: 91,
            alpha: 1)
        view.setTitle(
            "+",
            for: .normal)
        view.layer.cornerRadius = 14
        view.titleLabel?.font = .systemFont(ofSize: 25)
        view.tintColor = .white
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAddTarget()
        setupAdd()
        setupConstrains()
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
    
    private func setupAddTarget() {
        plusButton.addTarget(self, action: #selector(incrementCounter), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(decrementCounter), for: .touchUpInside)
    }
    
    private func setupAdd() {
        addSubview(leftImage)
        addSubview(stackLabels)
        stackLabels.addArrangedSubview(naminglabels)
        stackLabels.addArrangedSubview(drinksLabels)
        contentView.addSubview(minusButton)
        contentView.addSubview(counterLabel)
        contentView.addSubview(plusButton)
    }
    
    private func setupConstrains() {
        
        leftImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(15)
            make.width.equalTo(89)
            make.height.equalTo(89)
        }
        
        stackLabels.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(leftImage.snp.right).offset(15)
            make.height.equalTo(63)
            make.width.equalTo(113)
        }
        
        minusButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(53)
            make.left.equalTo(stackLabels.snp.right).offset(55)
            make.height.equalTo(28)
            make.width.equalTo(28)
        }
        
        counterLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(58)
            make.right.equalToSuperview().offset(-58)
        }
        
        plusButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(53)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(28)
            make.width.equalTo(28)
        }
        
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
