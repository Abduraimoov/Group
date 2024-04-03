//
//  AutorizationViewController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/2/24.
//

import UIKit

class AutorizationViewController: UIViewController{
    
    private lazy var autorizationview = AutorizationView(frame: .zero)

    
    override func loadView() {
        super.loadView()
        view = autorizationview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        autorizationview.delegate = self
        homeScreenTapped()
    }
    
    private func homeScreenTapped() {
        autorizationview.screenTransition = {
            let vc = HomeViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}

extension AutorizationViewController: AutorizationViewDelegate  {

}
