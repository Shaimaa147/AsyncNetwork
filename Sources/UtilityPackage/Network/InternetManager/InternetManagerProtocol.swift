//
//  InternetManagerProtocol.swift
//  MSZNearBy
//
//  Created by MSZ on 12/6/19.
//  Copyright © 2019 MSZ. All rights reserved.
//

import Foundation

public protocol InternetManagerProtocol: class {
    func  isInternetConnectionAvailable () -> Bool
}
