//
//  File.swift
//  
//
//  Created by Shaimaa Mohammed on 20/03/2024.
//

import Foundation

public class APIManager: NetworkManagerProtocol {
    
    public static let shared = APIManager()
        
    private init() {}
    public func perform<T: Codable>(apiRequest: APIRequestProtocol,
                             providerType: APIRequestProviderProtocol,
                                    outputType: T.Type) async -> [T] {
        return await call(providerType: providerType, outputType: T.self, apiRequest: apiRequest)
    }
    
    private func call<T: Codable>(providerType: APIRequestProviderProtocol,
                                  outputType: T.Type,
                                  apiRequest: APIRequestProtocol) async -> [T] {
        do {
            let data = try await providerType.handle(apiRequest: apiRequest)
//            let dataString = String(data: data, encoding: .utf8)
//            print(dataString)
            let jsonDecoder = JSONDecoder()
            let parsedData = try! jsonDecoder.decode([T].self, from: data)
            return  parsedData
        } catch NetworkError.invalidUrl {
            print("Invalid URL.")
        } catch NetworkError.invalidData {
            print("Invalid DATA.")
        } catch NetworkError.noInternet {
            print("NO Internet.")
        } catch NetworkError.requestFailed {
            print("Request failed.")
        } catch {
            print ("Unexpected" + "\(error)")
        }
        return []
    }
    
}
