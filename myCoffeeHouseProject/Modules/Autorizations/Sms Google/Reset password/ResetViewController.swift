//
//  ResetViewController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/21/24.
//

import UIKit

class ResetViewController: UIViewController {
    
    private var resetScreen = ResetView(frame: .zero)
    
    override func loadView() {
        super.loadView()
        view = resetScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.tintColor = .black
        setupTransilation()
    }
    
    
    private func setupTransilation() {
        resetScreen.screenTransilation = {
            let vc = UpdatedViewController()
            self.navigationController?.pushViewController(vc,
                                                          animated: true)
        }
    }
    
}



