//
//  UpdatedViewController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/21/24.
//

import UIKit

class UpdatedViewController: UIViewController {
    
    private var updatedScreen = UpdatedView(frame: .zero)
    
    override func loadView() {
        super.loadView()
        view = updatedScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.tintColor = .black
        setupTransilation()
        
    }
    
    private func setupTransilation() {
        updatedScreen.screenTransilation = {
            let vc = TabBarController()
                self.navigationController?.pushViewController(vc,
                                                     animated: true)
        }
    }
}
