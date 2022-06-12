//
//  ColorExtension.swift
//  CSVParser
//
//  Created by Errol Liebenberg on 2022/06/11.
//

import UIKit

extension UIColor {
    
    static var primaryColor: UIColor {
        return named("primaryColor")
    }
    
    static var secondaryColor: UIColor {
        return named("secondaryColor")
    }
    
    static var darkTextColor: UIColor {
        return named("darkTextColor")
    }
    
    static var lightBackgroundColor: UIColor {
        return named("lightBackgroundColor")
    }
    
    private static func named(_ named: String) -> UIColor {
        return UIColor(named: named) ?? UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
    }
    
}
