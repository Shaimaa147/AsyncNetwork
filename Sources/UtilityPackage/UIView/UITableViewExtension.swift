//
//  File.swift
//
//
//  Created by Shaimaa Mohammed on 12/03/2024.
//

import Foundation
import UIKit


public extension UITableView {
    
    /**
     Register nibs faster by passing the type - if for some reason the `identifier` is different then it can be passed
     - Parameter type: UITableViewCell.Type
     - Parameter identifier: String?
     */
    func registerCell(type: UITableViewCell.Type, identifier: String? = nil) {
        let cellId = String(describing: type)
        register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: identifier ?? cellId)
    }
    
    /**
     DequeueCell by passing the type of UITableViewCell
     - Parameter type: UITableViewCell.Type
     */
    func dequeueCell<T: UITableViewCell>(withType type: UITableViewCell.Type) -> T? {
        return dequeueReusableCell(withIdentifier: type.identifier) as? T
    }
    
    /**
     DequeueCell by passing the type of UITableViewCell and IndexPath
     - Parameter type: UITableViewCell.Type
     - Parameter indexPath: IndexPath
     */
    func dequeueCell<T: UITableViewCell>(withType type: UITableViewCell.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: type.identifier, for: indexPath) as? T
    }
    
}

public extension UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
}

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

