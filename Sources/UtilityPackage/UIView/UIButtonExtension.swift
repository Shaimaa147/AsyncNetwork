//
//  File.swift
//
//
//  Created by Shaimaa Mohammed on 11/03/2024.
//

import Foundation

//#if canImport(UIKit)
import UIKit

//extension
extension UIButton {
    
    public func configureAttributes(backgroundColor: UIColor, title: String, titleState: UIControl.State, tintColor: UIColor){
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: titleState)
        self.tintColor = tintColor
    }
    
    ///
    override open var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
                self.titleLabel?.alpha = self.isHighlighted ? 0.3 : 1
                self.transform = self.isHighlighted ? .init(scaleX: 0.1, y: 0.5) : .identity
            }, completion: nil)
        }
      }
    
}



//#endif
