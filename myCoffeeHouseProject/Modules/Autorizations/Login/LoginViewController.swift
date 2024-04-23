//
//  LoginViewController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/20/24.
//

import UIKit
import SnapKit

protocol LoginViewControllerDelegate: AnyObject {
    func didLoginButton()
    func didForgotButton()
}

class LoginViewController: UIViewController {
    
    private lazy var loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.tintColor = .black
        loginView.delegate = self
        setupConstrains()
    }
    
    private func setupConstrains() {
        view.addSubview(loginView)
        loginView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

extension LoginViewController: LoginViewControllerDelegate {
    func didForgotButton() {
        let vc = ForgotPasswordViewController()
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }
    
    func didLoginButton() {
        let vc = TabBarController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
