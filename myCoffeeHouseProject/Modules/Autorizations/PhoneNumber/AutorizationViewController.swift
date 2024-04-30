//
//  AutorizationViewController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/2/24.
//

import UIKit
import FirebaseAuth
import SnapKit

class AutorizationViewController: UIViewController {
    
    private let autorizationview = AutorizationView()
    private let authService = AuthService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        autorizationview.delegate = self
        navigationItem.backButtonTitle = ""
        setupConstrains()
    }
    
    private func setupConstrains() {
        view.addSubview(autorizationview)
        autorizationview.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(135)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview().offset(-250)
        }
    }
    
    private func smsCode() {
        let vc = SmsViewController()
        self.navigationController?.pushViewController(vc,
                                                      animated: true)
    }
}

extension AutorizationViewController: AutorizationViewDelegate {
    
    func smsCode(with phoneNumberTFText: String) {
        
        authService.sendSmsCode(with: phoneNumberTFText) { result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    let vc = SmsViewController()
                    self.navigationController?.pushViewController(vc, animated: true)
                case .failure(let error):
                    print("Failed to send SMS: \(error.localizedDescription)")
                }
            }
        }
    }
    
}
