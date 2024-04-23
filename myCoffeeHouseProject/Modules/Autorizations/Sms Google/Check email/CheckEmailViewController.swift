//
//  CheckEmailViewController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/21/24.
//

import UIKit
import SnapKit

protocol CheckEmailViewControllerDelegate: AnyObject {
    func didResumbitButton()
    func didContinueButton()
}

class CheckEmailViewController: UIViewController {
    
    private var chekEmail = CheckEmailView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .black
        chekEmail.delegate = self
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(chekEmail)
        chekEmail.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(229)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview().offset(-121)
        }
    }
}

extension CheckEmailViewController: CheckEmailViewControllerDelegate {
    func didResumbitButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func didContinueButton() {
        let vc = ResetViewController()
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }
}
