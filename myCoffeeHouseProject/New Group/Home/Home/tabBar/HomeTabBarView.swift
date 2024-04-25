//
//  HomeTabBarView.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/9/24.
//

import UIKit

protocol HomeTabBarViewDelegate: AnyObject {
    func setControllers(controllers: [UIViewController])
}

class HomeTabBarView: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    private func setupTabs() {
        
        let home = self.createFunc(image: UIImage(systemName: "house"), vc: <#T##UIViewController#>)
        
        self.setViewControllers([], animated: true)
        
    }
    
    private func createFunc(image: UIImage?,
                            vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        
        nav.tabBarItem.image = image
        
        nav.viewControllers[0]
        
        return nav
    }


}
