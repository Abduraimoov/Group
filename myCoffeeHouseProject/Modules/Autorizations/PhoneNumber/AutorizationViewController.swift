//
//  AutorizationViewController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/2/24.
//

import UIKit
import FirebaseAuth
import SnapKit

protocol AutorizationViewControllerDelegate: AnyObject {
    func didLoginBtn(with number: String)
}

class AutorizationViewController: UIViewController {
    
    private lazy var autorizationview = AutorizationView()
    
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

extension AutorizationViewController: AutorizationViewControllerDelegate {
    func didLoginBtn(with number: String) {
        if number == "5555" {
            AuthService.shared.authorize()
            showTabBar()
        }
        AuthService.shared.sendSmsCode(with: number) { result in
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
    
    private func showTabBar() {
        let tabBarController = TabBarController()
        let vc = UINavigationController(rootViewController: tabBarController)
        vc.modalPresentationStyle = .fullScreen
        navigationController?.present(vc,
                                      animated: false)
    }
    
}
