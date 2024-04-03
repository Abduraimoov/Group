//
//  HomeViewController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/2/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var HoryzontalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
