//
//  HomeTabBarController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/11/24.
//

import UIKit

class HomeTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }
    
    private func generateVC(viewController: UIViewController,
                            title: String,
                            image: UIImage?,
                            rightBarButtonImage: UIImage?) -> UIViewController {
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.tintColor = .black
        viewController.tabBarItem.image = image
        
        viewController.navigationItem.title = title
        if let Image = rightBarButtonImage {
            let rightBarButtonItem = UIBarButtonItem(image: Image,
                                                     style: .plain,
                                                     target: viewController,
                                                     action: .none)
            viewController.navigationItem.rightBarButtonItem = rightBarButtonItem
        }
        return navigationController
    }


    private func generateTabBar() {
        viewControllers = [
            generateVC(viewController: HomeViewController(),
                       title: "Дом",
                       image: UIImage(systemName: "house"),
                       rightBarButtonImage: UIImage(systemName: "bell")),
            generateVC(viewController: StorageViewController(),
                       title: "Склад",
                       image: UIImage(systemName: "cart.badge.questionmark.rtl"),
                       rightBarButtonImage: UIImage(systemName: "paperclip")),
            generateVC(viewController: ScannerViewController(),
                       title: "Сканер",
                       image: UIImage(systemName: "qrcode.viewfinder"),
                       rightBarButtonImage: UIImage(systemName: "camera")),
            generateVC(viewController: CompassViewController(), 
                       title: "Компас",
                       image: UIImage(systemName: "safari"),
                       rightBarButtonImage: UIImage(systemName: "location")),
            generateVC(viewController: MenuViewController(),
                       title: "Меню",
                       image: UIImage(systemName: "person"),
                       rightBarButtonImage: UIImage(systemName: "gear"))
        ]
    }
    
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 8
        let positionOnY: CGFloat = 13
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        let bezierPath = UIBezierPath(roundedRect: CGRect(x: positionOnX,
                                                          y: tabBar.bounds.minY - positionOnY,
                                                          width: width,
                                                          height: height),
                                      cornerRadius: height / 2)
        
        roundLayer.path = bezierPath.cgPath
        roundLayer.fillColor = UIColor.white.cgColor
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        tabBar.tintColor = UIColor.systemBlue
        tabBar.unselectedItemTintColor = UIColor.gray
    }

}

