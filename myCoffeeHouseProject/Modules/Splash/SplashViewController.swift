//
//  SplashViewController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/23/24.
//

import UIKit
import FirebaseAuth

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
        let phoneViewController = StartingViewController()
        let vc = UINavigationController(rootViewController: phoneViewController)
        vc.modalPresentationStyle = .fullScreen
        navigationController?.present(vc,
                                      animated: false)
    }
    
    private func showTabBar() {
        let tabBarController = TabBarController()
        let vc = UINavigationController(rootViewController: tabBarController)
        vc.modalPresentationStyle = .fullScreen
        navigationController?.present(vc,
                                      animated: false)
    }
}
