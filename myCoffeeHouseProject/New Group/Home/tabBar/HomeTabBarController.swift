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
    }
    
    private func generateTabBar() {
        viewControllers = [
        generateVC(viewController: HomeViewController(), image: UIImage(systemName: "house")),
        generateVC(viewController: <#T##UIViewController#>, image: <#T##UIImage?#>)
        ]
    }
    
    private func generateVC(viewController: UIViewController,
                            image: UIImage?) -> UIViewController {
        viewController.tabBarItem.image = image
        return viewController
    }
    
}
