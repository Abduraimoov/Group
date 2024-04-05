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
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width), height: 100)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let view = UICollectionView(frame: .zero,
                                    collectionViewLayout: layout)
        view.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupNavigtionItem()
        setupConstrains()
        elementsCell()
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
        verticalCollectionView.dataSource = self
    }
    
    private func elementsCell() {
        elements = [
        Elements(image: "Coffee",
                 naming: "Капучино",
                 drink: "Кофейный напиток",
                 Money: "140 c",
                 minus: "-",
                 counter: "",
                 plus: "+"),
        Elements(image: "Coffee1",
                 naming: "Латте",
                 drink: "Кофейный напиток",
                 Money: "140 c",
                 minus: "-",
                 counter: "",
                 plus: "+"),
        Elements(image: "Coffee2",
                 naming: "Американо",
                 drink: "Кофейный напиток",
                 Money: "100 c",
                 minus: "-",
                 counter: "",
                 plus: "+"),
        Elements(image: "Coffee3",
                 naming: "Раф",
                 drink: "Кофейный напиток",
                 Money: "170 c",
                 minus: "-", 
                 counter: "",
                 plus: "+"),
        Elements(image: "Coffee4",
                 naming: "Экспрессо",
                 drink: "Кофейный напиток",
                 Money: "100 c",
                 minus: "-",
                 counter: "",
                 plus: "+"),
        Elements(image: "Coffee5",
                 naming: "Мокко",
                 drink: "Кофейный напиток",
                 Money: "150 c",
                 minus: "-",
                 counter: "",
                 plus: "+"),
        ]
    }
    
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return elements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard indexPath.row < elements.count else {
            return UICollectionViewCell()
        }

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        cell.configure(with: elements[indexPath.row])
        return cell
    }
    
    
}
