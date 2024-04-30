//
//  UIViewController + extension.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/29/24.
//

import UIKit

extension UIViewController {
    
    func showAlert() {
        let alertController = UIAlertController(title: "Sorry, but it seems the SMS code is incorrect. Could you please check it and send the correct one?",
                                                message: nil,
                                                preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK",
                                     style: .default)
        
        alertController.addAction(okAction)
        
        present(alertController,
                animated: true)
    }
}
