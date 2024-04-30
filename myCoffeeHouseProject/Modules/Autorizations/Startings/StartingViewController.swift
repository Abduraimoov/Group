//
//  StartingViewController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 3/31/24.
//

import UIKit

protocol startingViewControllerDelegate: AnyObject {
    func didRegisterButton()
    func didLoginButton()
}

class StartingViewController: UIViewController {
    
    private lazy var startingView = StartignView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        startingView.delegate = self
        navigationItem.hidesBackButton = true
        navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.tintColor = .black
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(startingView)
        startingView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(85)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview().offset(-45)
        }
    }
}

extension StartingViewController: startingViewControllerDelegate {
    
    func didLoginButton() {
        let vc = LoginViewController()
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }
    
    func didRegisterButton() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }
}
