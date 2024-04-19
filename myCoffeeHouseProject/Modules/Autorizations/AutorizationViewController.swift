//
//  AutorizationViewController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/2/24.
//

import UIKit
import FirebaseAuth

class AutorizationViewController: UIViewController {
    
    private lazy var autorizationview = AutorizationView(frame: .zero)
    
    private let authService = AuthService()
    
    override func loadView() {
        super.loadView()
        view = autorizationview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        autorizationview.delegate = self
        navigationItem.backButtonTitle = ""
    }
    
    private func smsCode() {
        let vc = SmsViewController()
        self.navigationController?.pushViewController(vc, 
                                                      animated: true)
    }
    
}

extension AutorizationViewController: AutorizationViewDelegate  {
    func didLoginBtn(with number: String) {
        guard let text = autorizationview.numberTextFeild.text else { return }
        authService.sendSmsCode(with: number) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    self.smsCode()
                case .failure(let error):
                    print(error.localizedDescription)
                    
                }
                
            }
        }
    }
    
}
