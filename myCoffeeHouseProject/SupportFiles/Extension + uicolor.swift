//
//  Extension + uicolor.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 3/31/24.
//

import UIKit

extension UIColor {
    func rgb(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor.init(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
}
