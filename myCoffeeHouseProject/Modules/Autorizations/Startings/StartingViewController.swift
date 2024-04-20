//
//  StartingViewController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 3/31/24.
//

import UIKit

class StartingViewController: UIViewController {
    
    private lazy var startingView = StartignView(frame: .zero)
    

    override func loadView() {
        super.loadView()
        view = startingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startingView.delegate = self
        screenTransition()
        registerScreens()
        navigationItem.hidesBackButton = true
        navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.tintColor = .black
    }

   private func screenTransition() {
        startingView.screenTransitionTapped = {
            let vc = LoginViewController()
            self.navigationController?.pushViewController(vc,
                                                          animated: true)
        }
    }
    
    private func registerScreens() {
        startingView.registerScreen = {
            let vc = RegisterViewController()
            self.navigationController?.pushViewController(vc,
                                                          animated: true)
        }
    }

}

extension StartingViewController: StartingViewDelegate {
    
}

