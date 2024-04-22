//
//  CheckEmailViewController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/21/24.
//

import UIKit

class CheckEmailViewController: UIViewController {
    
    private var chekEmail = CheckEmailView(frame: .zero)
    
    override func loadView() {
        super.loadView()
        view = chekEmail
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.tintColor = .black
        setupResetScreen()
        setupPopToview()
    }
    
    private func setupResetScreen() {
        chekEmail.resetScreenTransilation = {
            let vc = ResetViewController()
            self.navigationController?.pushViewController(vc,
                                                          animated: true)
        }
    }
    
    private func setupPopToview() {
        chekEmail.popToViewTransilation = {
            self.navigationController?.popViewController(animated: true)
        }
    }
}

