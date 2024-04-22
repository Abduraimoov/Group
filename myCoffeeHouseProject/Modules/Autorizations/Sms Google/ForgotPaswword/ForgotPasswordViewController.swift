//
//  ForgotPasswordViewController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/21/24.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    let forgotView = ForgotPasswordView(frame: .zero)
    
    override func loadView() {
        view = forgotView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.tintColor = .black
        screenTransilation()
        transilationLoginScreen()
    }
    
    private func screenTransilation() {
        forgotView.screenTransilation = {
            let vc = CheckEmailViewController()
            self.navigationController?.pushViewController(vc,
                                                     animated: true)
        }
    }
    
    private func transilationLoginScreen() {
        forgotView.loginScreenTransilation = {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
