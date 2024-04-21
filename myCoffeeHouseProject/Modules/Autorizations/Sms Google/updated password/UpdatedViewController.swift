//
//  UpdatedViewController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/21/24.
//

import UIKit

class UpdatedViewController: UIViewController {

    private var updatedScreen = UpdatedView()
    
    override func loadView() {
        super.loadView()
        view = updatedScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.tintColor = .black
        setupConstrains()
    }
    
    private func setupConstrains() {
        let emailIcon = updatedScreen.emailIcon
        let emailLabel = updatedScreen.emaillabel
        let deckription = updatedScreen.deckriptionlabel
        let button = updatedScreen.ContinueButton
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
            
            button.topAnchor.constraint(equalTo: deckription.topAnchor, constant: 260),
            button.leftAnchor.constraint(equalTo: view.leftAnchor,
                                         constant: 26),
            button.rightAnchor.constraint(equalTo: view.rightAnchor,
                                          constant: -26),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        button.addTarget(self,
                         action: #selector(resetView),
                         for: .touchUpInside)
        
    }

    @objc private func resetView() {
        let vc = TabBarController()
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }

}
