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
        generateVC(viewController: MoreViewController(),
                   image: UIImage(systemName: "person")),
       
        ]
    }
    
    private func generateVC(viewController: UIViewController,
                            image: UIImage?) -> UIViewController {
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 8
        let positionOnY: CGFloat = 13
        let widht = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(roundedRect: CGRect(x: positionOnX,
                                                          y: tabBar.bounds.minY - positionOnY,
                                                          width: widht,
                                                          height: height),
                                      cornerRadius: height / 2)
        
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer,
                                    at: 0)
        
        tabBar.itemWidth = widht / 5
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.mainWhite.cgColor
        tabBar.tintColor = .tabbatItemAccent
        tabBar.unselectedItemTintColor = .tabBarItemLight
    }
}
