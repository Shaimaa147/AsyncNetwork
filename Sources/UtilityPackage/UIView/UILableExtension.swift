//
//  File.swift
//  
//
//  Created by Shaimaa Mohammed on 12/03/2024.
//

import Foundation
import UIKit


extension UILabel {
    @IBInspectable
    public var rotation: Int {
        get {
            return 0
        } set {
            let radians = CGFloat(CGFloat(Double.pi) * CGFloat(newValue) / CGFloat(180.0))
            self.transform = CGAffineTransform(rotationAngle: radians)
        }
    }
    
    
    
}
