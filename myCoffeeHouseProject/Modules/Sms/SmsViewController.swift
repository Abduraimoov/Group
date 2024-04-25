//
//  SmsViewController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/11/24.
//

import UIKit

protocol SmsViewControllerDelegate: AnyObject {
    func didLoginButton()
}

class SmsViewController: UIViewController {
    
    private lazy var smsView = SmsView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        smsView.delegate = self
        navigationItem.backButtonTitle = ""
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(smsView)
        smsView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(155)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview().offset(-319)
        }
    }
}
extension SmsViewController: SmsViewControllerDelegate {
    func didLoginButton() {
        let vc = TabBarController()
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }
}
