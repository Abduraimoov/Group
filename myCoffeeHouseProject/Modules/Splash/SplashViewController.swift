//
//  SplashViewController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/23/24.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       let currentTime = Date()
        if let sessionDate = UserDefaults.standard.object(
            forKey: "session"
        ) as? Date,
           sessionDate >= currentTime {
            showTabBar()
        } else {
            showPhoneNumber()
        }
    }
    
    private func showPhoneNumber() {
        let phoneViewController = AutorizationViewController()
        phoneViewController.modalPresentationStyle = .fullScreen
        let vc = UINavigationController(rootViewController: phoneViewController)
        navigationController?.present(vc,
                                      animated: false)
    }
    
    private func showTabBar() {
        let tabBarController = TabBarController()
        tabBarController.modalPresentationStyle = .fullScreen
        let vc = UINavigationController(rootViewController: tabBarController)
        navigationController?.present(vc,
                                      animated: false)
    }
}
