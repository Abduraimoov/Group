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
        setupNavigationItem()
    }
    
    private func setupNavigationItem() {
        navigationItem.title = "Меню"
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell"),
                                                 style: .plain,
                                                 target: self,
                                                 action: .none)
        rightBarButtonItem.tintColor = .black
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    private func generateVC(viewController: UIViewController,
                            image: UIImage?) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        viewController.tabBarItem.image = image
        return viewController
    }

    private func generateTabBar() {
        viewControllers = [
            generateVC(viewController: HomeViewController(),
                       image: UIImage(systemName: "house")),
            generateVC(viewController: StorageViewController(),
                       image: UIImage(systemName: "cart.badge.questionmark.rtl")),
            generateVC(viewController: ScannerViewController(),
                       image: UIImage(systemName: "qrcode.viewfinder")),
            generateVC(viewController: CompassViewController(),
                       image: UIImage(systemName: "safari")),
            generateVC(viewController: MenuViewController(),
                       image: UIImage(systemName: "person"))
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
