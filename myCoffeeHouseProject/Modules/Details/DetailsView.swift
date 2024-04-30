//
//  DetailsView.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/30/24.
//

import UIKit
import SnapKit

class DetailsView: UIView {
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let descriptionImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 18
        view.clipsToBounds = true
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 22, weight: .medium)
        return label
    }()
    
    private let deckriptionLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textColor = .label
        return label
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textColor = .label
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.numberOfLines = 0
        return label
    }()
    
    private let buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("To order", for: .normal)
        button.backgroundColor = UIColor().rgb(r: 251, g: 222, b: 63, alpha: 100)
        button.tintColor = .label
        button.layer.cornerRadius = 18
        
        return button
    }()
    
    var idMeal: String?
    
    weak var delegate: DetailslViewControllerDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupAdds()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fill(with item: Meal) {
        titleLabel.text = item.strMeal
        deckriptionLabel.text = item.strArea
        categoryLabel.text = item.strCategory
        descriptionLabel.text = item.strInstructions
        ImageDownloader.shared.loadImage(from: item.strMealThumb) { [weak self] result in
            if case .success(let image) = result {
                DispatchQueue.main.async {
                    self?.descriptionImage.image = image
                }
            }
        }
    }
    
    private func setupAdds() {
        buyButton.addTarget(
            self,
            action: #selector(screenTransilation),
            for: .touchUpInside)
        addSubview(scrollView)
        contentView.addSubview(descriptionImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(deckriptionLabel)
        contentView.addSubview(categoryLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(buyButton)
    }
    
    private func setupConstraints() {
        
        scrollView.addSubview(contentView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.top.bottom.equalTo(scrollView)
            make.left.right.equalTo(scrollView)
            make.width.equalTo(scrollView)
            
        }
        
        descriptionImage.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(10)
            make.horizontalEdges.equalTo(contentView)
            make.height.equalTo(225)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionImage.snp.bottom).offset(15)
            make.horizontalEdges.equalTo(contentView).inset(16)
        }
        
        deckriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalTo(contentView).offset(16)
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.trailing.equalTo(contentView).offset(-16)
            
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(deckriptionLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(contentView).inset(16)
        }
        
        buyButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(contentView).inset(16)
            make.bottom.equalTo(contentView).offset(-10)
            make.height.equalTo(50)
        }
    }
    
    @objc
    private func screenTransilation() {
        delegate?.didBuyButton()
    }
}
