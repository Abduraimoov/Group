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
    }

   private func screenTransition() {
        startingView.screenTransitionTapped = {
            let vc = AutorizationViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}

extension StartingViewController: StartingViewDelegate {
    
}

