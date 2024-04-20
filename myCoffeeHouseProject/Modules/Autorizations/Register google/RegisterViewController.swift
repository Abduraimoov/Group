//
//  RegisterViewController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/20/24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private lazy var registerview = RegisterView(frame: .zero)
    
    override func loadView() {
        super.loadView()
        view = registerview
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        transilarion()
    }
    
    private func transilarion() {
        registerview.screenTransition = {
            let vc = TabBarController()
                self.navigationController?.pushViewController(vc,
                                                     animated: true)
        }
    }
    

}
