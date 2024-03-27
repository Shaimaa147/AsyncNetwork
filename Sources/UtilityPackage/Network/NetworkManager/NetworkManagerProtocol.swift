//
//  File.swift
//
//
//  Created by Shaimaa Mohammed on 20/03/2024.
//

import Foundation

public protocol NetworkManagerProtocol: AnyObject {
    func perform<T: Codable>(apiRequest: APIRequestProtocol,
                             providerType: APIRequestProviderProtocol,
                             outputType: T.Type) async -> [T]
}
