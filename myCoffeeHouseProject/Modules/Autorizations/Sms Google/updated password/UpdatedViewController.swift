//
//  UpdatedViewController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/21/24.
//

import UIKit
import SnapKit

protocol UpdatedViewControllerDelegate: AnyObject {
    func didContinueButton()
}

class UpdatedViewController: UIViewController {
    
    private var updatedScreen = UpdatedView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.tintColor = .black
        updatedScreen.delegate = self
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(updatedScreen)
        updatedScreen.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(228)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview().offset(-121)
        }
    }
}

extension UpdatedViewController: UpdatedViewControllerDelegate {
    func didContinueButton() {
        let vc = TabBarController()
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }
}
