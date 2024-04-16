//
//  SmsViewController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/11/24.
//

import UIKit

class SmsViewController: UIViewController {
    
    private lazy var smsView = SmsView(frame: .zero)
    
    override func loadView() {
        super.loadView()
        view = smsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        smsView.delegate = self
        nextTapped()
        navigationItem.backButtonTitle = ""
    }
    
    private func nextTapped() {
        smsView.screenTransition = {
            let vc = TabBarController()
            self.navigationController?.pushViewController(vc,
                                                     animated: true)
        }
    }
   
}
extension SmsViewController: SmsViewDelegate {
    
}
