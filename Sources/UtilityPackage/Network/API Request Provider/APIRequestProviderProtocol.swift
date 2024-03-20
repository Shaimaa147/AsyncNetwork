//
//  File.swift
//  
//
//  Created by Shaimaa Mohammed on 20/03/2024.
//

import Foundation

public protocol APIRequestProviderProtocol {
    typealias APIRequestCompletion = (_ result: Result<Data, NSError>) -> Void
    func handle(apiRequest: APIRequestProtocol, completion: @escaping APIRequestCompletion)
}
