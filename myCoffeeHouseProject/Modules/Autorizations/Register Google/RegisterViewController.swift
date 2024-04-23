//
//  RegisterViewController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/20/24.
//

import UIKit

protocol RegisterViewControllerDelegate: AnyObject {
    func didSingupbutton()
}

class RegisterViewController: UIViewController {
    
    private lazy var registerview = RegisterView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.backButtonTitle = ""
        registerview.delegate = self
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(registerview)
        registerview.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(62)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview().offset(-106)
        }
    }
}

extension RegisterViewController: RegisterViewControllerDelegate {
    func didSingupbutton() {
        let vc = TabBarController()
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }
}
