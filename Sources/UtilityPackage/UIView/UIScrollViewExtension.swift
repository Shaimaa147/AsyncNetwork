//
//  File 2.swift
//  
//
//  Created by Shaimaa Mohammed on 12/03/2024.
//

import Foundation
import UIKit

extension UIScrollView {
    
    func scrollToBottom(animated: Bool) {
        if self.contentSize.height < self.bounds.size.height { return }
        let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height)
        self.setContentOffset(bottomOffset, animated: animated)
    }
    
}
