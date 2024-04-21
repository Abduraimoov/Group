//
//  CheckEmailViewController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/21/24.
//

import UIKit

class CheckEmailViewController: UIViewController {
    
    private var chekEmail = CheckEmailView()
    
    override func loadView() {
        super.loadView()
        view = chekEmail
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.tintColor = .black
        setupConstrains()
    }
    
    private func setupConstrains() {
        let emailIcon = chekEmail.emailIcon
        let emailLabel = chekEmail.emaillabel
        let deckription = chekEmail.deckriptionlabel
        let stack = chekEmail.stackLabels
        let resumbit = chekEmail.resubmitButton
        let button = chekEmail.ContinueButton
        NSLayoutConstraint.activate([
            emailIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                           constant: 160),
            emailIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailIcon.heightAnchor.constraint(equalToConstant: 81),
            emailIcon.widthAnchor.constraint(equalToConstant: 81),
            
            emailLabel.topAnchor.constraint(equalTo: emailIcon.bottomAnchor,
                                            constant: 24),
            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            deckription.topAnchor.constraint(equalTo: emailLabel.bottomAnchor,
                                             constant: 16),
            deckription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            deckription.widthAnchor.constraint(equalToConstant: 240),
            
            stack.topAnchor.constraint(equalTo: deckription.bottomAnchor,
                                       constant: 32),
            stack.leftAnchor.constraint(equalTo: view.leftAnchor,
                                        constant: 106),
            stack.rightAnchor.constraint(equalTo: view.rightAnchor,
                                         constant: -106),
            stack.heightAnchor.constraint(equalToConstant: 20),
            
            button.topAnchor.constraint(equalTo: stack.topAnchor, constant: 205),
            button.leftAnchor.constraint(equalTo: view.leftAnchor,
                                         constant: 26),
            button.rightAnchor.constraint(equalTo: view.rightAnchor,
                                          constant: -26),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        resumbit.addTarget(self,
                           action: #selector(resubmitTapped),
                           for: .touchUpInside)
        button.addTarget(self,
                         action: #selector(resetView),
                         for: .touchUpInside)
        
    }
    
    @objc private func resubmitTapped() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func resetView() {
        let vc = ResetViewController()
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }

}
