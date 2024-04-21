//
//  ResetViewController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/21/24.
//

import UIKit

class ResetViewController: UIViewController {
    
    private var resetScreen = ResetView()
    
    override func loadView() {
        super.loadView()
        view = resetScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.tintColor = .black
        setupConstrains()
    }
    
    private func setupConstrains() {
        let resetLabel = resetScreen.resetLabel
        let deckription = resetScreen.deckriptionLabel
        let passwordTextField = resetScreen.passwordTextField
        let confirmTextField = resetScreen.confirmTextField
        let resetButton = resetScreen.ResetPasswordButton
        NSLayoutConstraint.activate([
            resetLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                            constant: 80),
            resetLabel.leftAnchor.constraint(equalTo: view.leftAnchor,
                                             constant: 43),
            
            deckription.topAnchor.constraint(equalTo: resetLabel.bottomAnchor,
                                             constant: 15),
            deckription.leftAnchor.constraint(equalTo: view.leftAnchor,
                                              constant: 37),
            
            passwordTextField.topAnchor.constraint(equalTo: deckription.bottomAnchor,
                                                   constant: 84),
            passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor,
                                                    constant: 26),
            passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor,
                                                     constant: -26),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            confirmTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,
                                                  constant: 25),
            confirmTextField.leftAnchor.constraint(equalTo: view.leftAnchor,
                                                   constant: 26),
            confirmTextField.rightAnchor.constraint(equalTo: view.rightAnchor,
                                                    constant: -26),
            confirmTextField.heightAnchor.constraint(equalToConstant: 50),
            
            resetButton.topAnchor.constraint(equalTo: confirmTextField.bottomAnchor,
                                             constant: 226),
            resetButton.leftAnchor.constraint(equalTo: view.leftAnchor,
                                              constant: 26),
            resetButton.rightAnchor.constraint(equalTo: view.rightAnchor,
                                               constant: -26),
            resetButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        resetButton.addTarget(self,
                              action: #selector(screenTransilation),
                              for: .touchUpInside)
    }

    @objc private func screenTransilation() {
        let vc = UpdatedViewController()
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }
}
