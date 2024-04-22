//
//  LoginViewController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/20/24.
//

import UIKit

protocol LoginViewControllerDelegate {
    
}

class LoginViewController: UIViewController {
    
    private lazy var loginview = LoginView(frame: .zero)
    
    override func loadView() {
        super.loadView()
        view = loginview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.tintColor = .black
        homeScreenTapped()
        transilationResetScreens()
    }
    
    private func homeScreenTapped() {
        loginview.homeTransilation = {
            let vc = TabBarController()
            self.navigationController?.pushViewController(vc,
                                                          animated: true)
        }
    }
    
    private func transilationResetScreens() {
        loginview.resetTransilation = {
            let vc = ForgotPasswordViewController()
            self.navigationController?.pushViewController(vc,
                                                          animated: true)
        }
    }
}
