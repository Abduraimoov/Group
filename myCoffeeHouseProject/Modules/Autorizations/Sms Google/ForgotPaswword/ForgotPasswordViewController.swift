//
//  ForgotPasswordViewController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/21/24.
//

import UIKit

protocol ForgotPasswordViewControllerDelegate: AnyObject {
    func didLoginButton()
    func didsumbitButton()
}

class ForgotPasswordViewController: UIViewController {
    
    let forgotView = ForgotPasswordView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .black
        setupConstraints()
        forgotView.delegate = self
    }
    
    private func setupConstraints() {
        view.addSubview(forgotView)
        forgotView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(175)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview().offset(-121)
        }
    }
}

extension ForgotPasswordViewController: ForgotPasswordViewControllerDelegate {
    
    func didLoginButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func didsumbitButton() {
        let vc = CheckEmailViewController()
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }
}
