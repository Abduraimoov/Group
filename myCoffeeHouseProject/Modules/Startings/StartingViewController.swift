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
    }

    func tapped() {
        startingView.screenTransitionTapped = {
            let vc = 
        }
    }

}

extension StartingViewController: StartingViewDelegate {
    
}

