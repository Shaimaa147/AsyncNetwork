//
//  File.swift
//
//
//  Created by Shaimaa Mohammed on 12/03/2024.
//

import Foundation
import UIKit


extension UITableView {
    
    
    //TableView with Dynamic Height
    //default heightLimits
//    private var maxHeight: CGFloat
//    private var minHeight: CGFloat
//    
//    public func setHeightLimits (maxHeight: Int, minHeight: Int){
//        self.maxHeight = CGFloat(maxHeight)
//        self.minHeight = CGFloat(minHeight)
//    }
//    
//    override public func layoutSubviews() {
//        super.layoutSubviews()
//        if bounds.size != intrinsicContentSize {
//            invalidateIntrinsicContentSize()
//        }
//    }
//    
//    override public var intrinsicContentSize: CGSize {
//        layoutIfNeeded()
//        if contentSize.height > maxHeight {
//            return CGSize(width: contentSize.width, height: maxHeight)
//        }
//        else if contentSize.height < minHeight {
//            return CGSize(width: contentSize.width, height: minHeight)
//        }
//        else {
//            return contentSize
//        }
//    }
    
}
