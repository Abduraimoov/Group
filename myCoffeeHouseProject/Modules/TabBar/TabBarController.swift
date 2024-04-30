//
//  HomeTabBarController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/11/24.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?, rightButtonSystemImageName: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        viewController.navigationItem.title = title
        viewController.tabBarItem.image = image
        let rightButton = UIBarButtonItem(
            image: UIImage(systemName: rightButtonSystemImageName),
            style: .plain,
            target: self,
            action: .none
        )
        rightButton.tintColor = .black
        viewController.navigationItem.rightBarButtonItem = rightButton
        return navController
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(
                viewController: HomeViewController(),
                title: "Главная",
                image: UIImage(systemName: "house"),
                rightButtonSystemImageName: "bell.fill"
            ),
            generateVC(
                viewController: StorageViewController(),
                title: "Хранилище",
                image: UIImage(systemName: "cart.badge.questionmark.rtl"),
                rightButtonSystemImageName: "envelope.fill"
            ),
            generateVC(
                viewController: ScannerViewController(),
                title: "Сканер",
                image: UIImage(systemName: "qrcode.viewfinder"),
                rightButtonSystemImageName: "gear"
            ),
            generateVC(
                viewController: CompassViewController(),
                title: "Компас",
                image: UIImage(systemName: "safari"),
                rightButtonSystemImageName: "star.fill"
            ),
            generateVC(
                viewController: MenuViewController(),
                title: "Меню",
                image: UIImage(systemName: "person"),
                rightButtonSystemImageName: "person.crop.circle"
            )
        ]
    }
    
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 8
        let positionOnY: CGFloat = 13
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
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
