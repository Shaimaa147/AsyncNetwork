//
//  File.swift
//  
//
//  Created by Shaimaa Mohammed on 20/03/2024.
//

import Foundation

class APIManager: NetworkManagerProtocol {

    func perform<T: Codable>(apiRequest: APIRequestProtocol,
                             providerType: APIRequestProviderProtocol,
                             outputType: T.Type) -> Void {
        return call(providerType: providerType, outputType: outputType, apiRequest: apiRequest)
    }

    private func call<T: Codable>(providerType: APIRequestProviderProtocol,
                                  outputType: T.Type,
                                  apiRequest: APIRequestProtocol) -> Void {
        
            providerType.handle(apiRequest: apiRequest, completion: { [weak self] result in
                if let result = self?.validate(result: result, outputType: outputType) {
                    switch result {
                    case .success(let data):
                        fulfill(data)
                    case .failure(let error):
                        reject(error)
                    }
                }
            })
        }
    

    private func validate<T: Codable>(result: Result<Data, NSError>,
                                      outputType: T.Type )-> Result<T, NSError> {

        let returnedresult: Result<T, NSError>

        switch result {
        case .failure(let error):
            returnedresult = .failure(error)
            
        case .success(let data):
            let jsonDecoder = JSONDecoder()
            let parsedData = try! jsonDecoder.decode(T.self, from: data)
            returnedresult = .success(parsedData)
            
        }
        return returnedresult
    }

}
