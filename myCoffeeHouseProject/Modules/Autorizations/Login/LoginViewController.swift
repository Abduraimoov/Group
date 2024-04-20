//
//  LoginViewController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/20/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var loginview = LoginView(frame: .zero)
    
    override func loadView() {
        super.loadView()
        view = loginview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreenTapped()
        navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    private func homeScreenTapped() {
        loginview.homeTransilation = {
            let vc = TabBarController()
            self.navigationController?.pushViewController(vc,
                                                          animated: true)
        }
        
  
    }
    
}
