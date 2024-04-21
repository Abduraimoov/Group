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
    }
    
    private func screenTransilation() {
        forgotView.screenTransilation = {
            let vc = CheckEmailViewController()
            self.navigationController?.pushViewController(vc,
                                                     animated: true)
        }
    }
    

}
