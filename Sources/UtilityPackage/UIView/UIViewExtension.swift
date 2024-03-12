//
//  File.swift
//
//
//  Created by Shaimaa Mohammed on 12/03/2024.
//

import Foundation
import UIKit

@IBDesignable extension UIView {
    
    //    static func fromNib() -> Self {
    //        guard let view = UINib(nibName: String(describing: Self.self), bundle: nil)
    //            .instantiate(withOwner: nil)
    //            .first as? Self else {
    //            fatalError("That needs to be a View")
    //        }
    //
    //        return view
    //    }
    
    @IBInspectable public var borderColor:UIColor? {
        set {
            layer.borderColor = newValue!.cgColor
            print("border coloer has been set")
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor:color)
            }
            else {
                return nil
            }
        }
    }
    @IBInspectable public var borderWidth:CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable public var cornerRadius:CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    @IBInspectable public var padding:CGFloat {
        
        set {
            self.bounds = self.frame.insetBy(dx: padding, dy: padding);
        }
        get {
            return self.bounds.origin.x
        }
    }
    
    class func loadFromNibNamed(_ nibNamed: String, bundle : Bundle? = nil,owner: AnyObject) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
        ).instantiate(withOwner: owner, options: nil)[0] as? UIView
    }
    
//    public func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
//        
//        let border = CALayer()
//        
//        switch edge {
//        case UIRectEdge.top:
//            border.frame = CGRect(x: 0, y: 0, width: self.frame.height, height: thickness)
//            break
//        case UIRectEdge.bottom:
//            border.frame = CGRect(x: 0, y: self.frame.height - thickness, width: UIScreen.main.bounds.width, height: thickness)
//            break
//        case UIRectEdge.left:
//            border.frame = CGRect(x: 0, y: 0, width: thickness, height: self.frame.height)
//            break
//        case UIRectEdge.right:
//            border.frame = CGRect(x: self.frame.width - thickness, y: 0, width: thickness, height: self.frame.height)
//            break
//        default:
//            break
//        }
        
//        border.backgroundColor = color.cgColor;
//        
//        self.layer.addSublayer(border)
//    }
    


}
