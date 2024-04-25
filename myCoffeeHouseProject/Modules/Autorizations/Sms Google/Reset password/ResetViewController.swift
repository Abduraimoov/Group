//
//  ResetViewController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/21/24.
//

import UIKit
import SnapKit

protocol ResetViewControllerDelegate: AnyObject {
    func didResetButton()
}

class ResetViewController: UIViewController {
    
    private var resetScreen = ResetView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .black
        resetScreen.delegate = self
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(resetScreen)
        resetScreen.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(175)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview().offset(-121)
        }
    }
}

extension ResetViewController: ResetViewControllerDelegate {
    func didResetButton() {
        let vc = UpdatedViewController()
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }
}
