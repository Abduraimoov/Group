//
//  HomeViewController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/11/24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private lazy var searchBar: UISearchBar = {
        let view = UISearchBar()
        view.placeholder = "Search"
        view.backgroundImage = UIImage()
        return view
    }()
    
    private lazy var verticalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(
            width: (UIScreen.main.bounds.width),
            height: 100)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(
            top: 10,
            left: 12,
            bottom: 0,
            right: 10)
        let view = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout)
        view.register(
            HomeCollectionViewCell.self,
            forCellWithReuseIdentifier: "cell")
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private lazy var horyzontalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(
            width: 75,
            height: 30)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(
            top: 10,
            left: 12,
            bottom: 0,
            right: 10)
        let view = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout)
        view.register(
            TopCollectionViewCell.self,
            forCellWithReuseIdentifier: "cell")
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    private var allProducts: [Product] = []
    
    private var categories: [Category] = []
    
    private let netWorkLayer = NetworkLayer()
    
    private var selectedCategory: Category? {
        didSet {
            fetchProduct(by: selectedCategory!)
        }
    }
    
    private var selectedIndex: IndexPath? {
        didSet {
            horyzontalCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupAdd()
        setupConstrains()
        createProduct()
        selectedIndexPath = IndexPath(item: 0,
                                      section: 0)
    }
    
    private func createProduct() {
        netWorkLayer.categories { result in
            switch result {
            case .success(let categories):
                DispatchQueue.main.async {
                    self.categories = categories
                    self.selectedCategory = categories.first!
                    self.horyzontalCollectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func fetchProduct(by category: Category) {
        netWorkLayer.fetchProducts(by: category.title) { result in
            switch result {
            case .success(let products):
                DispatchQueue.main.async {
                    self.allProducts = products
                    self.verticalCollectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func setupAdd() {
        view.addSubview(searchBar)
        view.addSubview(horyzontalCollectionView)
        view.addSubview(verticalCollectionView)
        verticalCollectionView.dataSource = self
        horyzontalCollectionView.dataSource = self
        horyzontalCollectionView.delegate = self
    }
    
    private func setupConstrains() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.right.equalToSuperview()
            make.height.equalTo(45)
        }
        
        horyzontalCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(60)
            make.left.right.equalToSuperview()
            make.height.equalTo(40)
        }
        
        verticalCollectionView.snp.makeConstraints { make in
            make.top.equalTo(horyzontalCollectionView.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview()
        }
    }
    
    private var selectedIndexPath: IndexPath?
    
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        if collectionView == horyzontalCollectionView {
            if let selectedIndexPath,
               let cell = collectionView.cellForItem(at: selectedIndexPath) as? TopCollectionViewCell {
                cell.backgroundColor = .clear
            }
            
            
            if let cell = collectionView.cellForItem(at: indexPath) as? TopCollectionViewCell {
                cell.backgroundColor = UIColor().rgb(
                    r: 251,
                    g: 222,
                    b: 63,
                    alpha: 100)
                cell.layer.cornerRadius = 15
                selectedIndexPath = indexPath
                let category = categories[indexPath.row]
                selectedCategory = category
            }
        }
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        if collectionView == verticalCollectionView {
            return allProducts.count
        } else {
            return categories.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == verticalCollectionView {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "cell",
                for: indexPath) as! HomeCollectionViewCell
            let model = allProducts[indexPath.row]
            cell.setup(product: model)
            return cell
        } else {
            guard indexPath.row < categories.count else {
                return UICollectionViewCell()
            }
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                          for: indexPath) as! TopCollectionViewCell
            let categoryProduct = categories[indexPath.row]
            cell.configure(list: categoryProduct)
            if indexPath == selectedIndexPath {
                cell.backgroundColor = UIColor().rgb(
                    r: 251,
                    g: 222,
                    b: 63,
                    alpha: 100)
                cell.layer.cornerRadius = 15
            } else {
                cell.backgroundColor = .clear
            }
            return cell
        }
    }
}
