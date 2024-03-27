//
//  File.swift
//
//
//  Created by Shaimaa Mohammed on 20/03/2024.
//

import Foundation

public class APIRequestProvider: NSObject, APIRequestProviderProtocol {
    
    private let internetManager: InternetManagerProtocol
    
    public init(internetManager: InternetManagerProtocol) {
        self.internetManager = internetManager
    }
    
    public func handle(apiRequest: APIRequestProtocol) async throws -> Data {
        guard internetManager.isInternetConnectionAvailable() else {
            throw NetworkError.noInternet
        }
        
        guard let url = URL(string: apiRequest.baseURL + apiRequest.path) else {
            throw NetworkError.invalidUrl
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                throw NetworkError.invalidResponse
            }
            
            do {
                
                return data
                
            } catch {
                throw NetworkError.invalidData
            }
            
        } catch {
            throw NetworkError.requestFailed
        }
    }
}
