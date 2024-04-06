//
//  HomeViewController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/2/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    var elements: [Elements] = []
    
    var listlabel: [labels] = []
    
    private lazy var horyzontalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 72,
                                 height: 35)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10,
                                           left: 12,
                                           bottom: 0,
                                           right: 10)
        let view = UICollectionView(frame: .zero,
                                    collectionViewLayout: layout)
        view.register(TopCollectionViewCell.self, 
                      forCellWithReuseIdentifier: "cell")
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
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width),
                                 height: 100)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let view = UICollectionView(frame: .zero,
                                    collectionViewLayout: layout)
        view.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var counterLabel: UILabel = {
        let view = UILabel()
        view.text = "0"
        view.tintColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupNavigtionItem()
        setupConstrains()
        elementsCell()
        topLabels()
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
        view.addSubview(horyzontalCollectionView)
        view.addSubview(coffeeLabel)
        view.addSubview(verticalCollectionView)
        NSLayoutConstraint.activate([
            
            horyzontalCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, 
                                                          constant: 10),
            horyzontalCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            horyzontalCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            horyzontalCollectionView.heightAnchor.constraint(equalToConstant: 32),
            
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
        horyzontalCollectionView.dataSource = self
        horyzontalCollectionView.delegate = self

    }
    
    private func elementsCell() {
        elements = [
        Elements(image: "Coffee",
                 naming: "Капучино",
                 drink: "Кофейный напиток",
                 Money: "140 c",
                 minus: "-",
                 counter: counterLabel.text ?? "",
                 plus: "+"),
        Elements(image: "Coffee1",
                 naming: "Латте",
                 drink: "Кофейный напиток",
                 Money: "140 c",
                 minus: "-",
                 counter: counterLabel.text ?? "",
                 plus: "+"),
        Elements(image: "Coffee2",
                 naming: "Американо",
                 drink: "Кофейный напиток",
                 Money: "160 c",
                 minus: "-",
                 counter: counterLabel.text ?? "",
                 plus: "+"),
        Elements(image: "Coffee3",
                 naming: "Раф",
                 drink: "Кофейный напиток",
                 Money: "189 c",
                 minus: "-",
                 counter: counterLabel.text ?? "",
                 plus: "+"),
        Elements(image: "Coffee4",
                 naming: "Экспрессо",
                 drink: "Кофейный напиток",
                 Money: "140 c",
                 minus: "-",
                 counter: counterLabel.text ?? "",
                 plus: "+"),
        Elements(image: "Coffee5",
                 naming: "Мокко",
                 drink: "Кофейный напиток",
                 Money: "240 c",
                 minus: "-",
                 counter: counterLabel.text ?? "",
                 plus: "+"),
        ]
    }
    
    private func topLabels() {
        listlabel = [
        labels(label: "Кофе"),
        labels(label: "Десерт"),
        labels(label: "Выпечка"),
        labels(label: "Коктейлы"),
        labels(label: "Машины"),
        ]
    }
    
    var selectedIndexPath: IndexPath?

    var counter: Int = 0 {
        didSet {
            counterLabel.text = "\(counter)"
        }
    }
    
}

extension HomeViewController: HomeCollectionViewCellDelegate {
    func didTapPlusButton(at indexPath: IndexPath) {
        counter += 1
    }

    func didTapMinusButton(at indexPath: IndexPath) {
        counter = max(0, counter - 1)
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == horyzontalCollectionView {
            if let selectedIndexPath = selectedIndexPath,
               let cell = collectionView.cellForItem(at: selectedIndexPath) as? TopCollectionViewCell {
                cell.backgroundColor = .clear
            }
            
            
            if let cell = collectionView.cellForItem(at: indexPath) as? TopCollectionViewCell {
                cell.backgroundColor = UIColor().rgb(r: 255,
                                                     g: 139,
                                                     b: 91,
                                                     alpha: 1)
                selectedIndexPath = indexPath
            }
        }
    }
}


extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, 
                        numberOfItemsInSection section: Int) -> Int {
        if collectionView == verticalCollectionView {
            return elements.count
        } else {
            return listlabel.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == verticalCollectionView {
            guard indexPath.row < elements.count else {
                return UICollectionViewCell()
            }
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                          for: indexPath) as! HomeCollectionViewCell
            let element = elements[indexPath.row]
            cell.configure(with: element)
            cell.delegate = self
            return cell
        } else {
            guard indexPath.row < listlabel.count else {
                return UICollectionViewCell()
            }
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                          for: indexPath) as! TopCollectionViewCell
            cell.configure(list: listlabel[indexPath.row])
            if indexPath == selectedIndexPath {
                cell.backgroundColor = UIColor().rgb(r: 255, g: 139, b: 91, alpha: 1)
            } else {
                cell.backgroundColor = .clear
            }
            return cell
            }
          
        }
        
    }

