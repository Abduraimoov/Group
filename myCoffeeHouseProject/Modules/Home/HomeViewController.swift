//
//  HomeViewController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/2/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    var elements: [Elements] = []
    
    private lazy var horyzontalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 72,
                                 height: 32)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let view = UICollectionView(frame: .zero,
                                    collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var coffeeLabel: UILabel = {
        let view = UILabel()
        view.text = "Кофе"
        view.tintColor = .black
        view.font = .systemFont(ofSize: 24, 
                                weight: .light)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var verticalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 89,
                                 height: 89)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let view = UICollectionView(frame: .zero,
                                    collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupNavigtionItem()
        setupConstrains()
    }

    private func setupNavigtionItem() {
        navigationItem.title = "Меню"
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell"),
                                                 style: .plain,
                                                 target: self,
                                                 action: .none)
        navigationItem.rightBarButtonItem = rightBarButtonItem
        navigationController?.navigationBar.tintColor = .black
    }
    
    private func setupConstrains() {
        view.addSubview(coffeeLabel)
        view.addSubview(verticalCollectionView)
        NSLayoutConstraint.activate([
            coffeeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                             constant: 50),
            coffeeLabel.leftAnchor.constraint(equalTo: view.leftAnchor,
                                              constant: 16),

            verticalCollectionView.topAnchor.constraint(equalTo: coffeeLabel.bottomAnchor,
                                                        constant: 16),
            verticalCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor,
                                                         constant: 16),
            verticalCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor,
                                                          constant: -16),
            verticalCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func elementsCell() {
        elements = [
        Elements(image: <#T##String#>, naming: <#T##String#>, drink: <#T##String#>, Money: <#T##String#>, minus: <#T##String#>, counter: <#T##String#>, plus: <#T##String#>),
        Elements(image: <#T##String#>, naming: <#T##String#>, drink: <#T##String#>, Money: <#T##String#>, minus: <#T##String#>, counter: <#T##String#>, plus: <#T##String#>),
        Elements(image: <#T##String#>, naming: <#T##String#>, drink: <#T##String#>, Money: <#T##String#>, minus: <#T##String#>, counter: <#T##String#>, plus: <#T##String#>),
        Elements(image: <#T##String#>, naming: <#T##String#>, drink: <#T##String#>, Money: <#T##String#>, minus: <#T##String#>, counter: <#T##String#>, plus: <#T##String#>),
        Elements(image: <#T##String#>, naming: <#T##String#>, drink: <#T##String#>, Money: <#T##String#>, minus: <#T##String#>, counter: <#T##String#>, plus: <#T##String#>),
        Elements(image: <#T##String#>, naming: <#T##String#>, drink: <#T##String#>, Money: <#T##String#>, minus: <#T##String#>, counter: <#T##String#>, plus: <#T##String#>),
        ]
    }
    
    
    
}
