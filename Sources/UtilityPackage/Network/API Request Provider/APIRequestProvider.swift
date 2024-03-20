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
    
    public func handle(apiRequest: APIRequestProtocol, completion: @escaping APIRequestCompletion) {
        guard internetManager.isInternetConnectionAvailable() else {
            let error = NSError(domain: apiRequest.baseURL, code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.noInternetError])
            completion(Result<Data, NSError>.failure(error))
            return
        }
        
        if let url = URL(string: apiRequest.baseURL + apiRequest.path) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    // print(error!)
                    let error = NSError(domain: apiRequest.baseURL, code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.fetchingError])
                    completion(.failure(error))
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    print("Error with the response, unexpected status code: \(String(describing: response))")
                    let error = NSError(domain: apiRequest.baseURL, code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.responseError])
                    completion(.failure(error))
                    return
                }
                if let safeData = data {
                    completion(Result<Data, NSError>.success(safeData))
                }
            }.resume()
        }
    }
}
