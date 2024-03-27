//
//  File.swift
//  
//
//  Created by Shaimaa Mohammed on 27/03/2024.
//

import Foundation

public enum NetworkError: Error {
    case requestFailed //(description: String)
    case invalidData
    case invalidUrl
    case invalidResponse //(description: String)
    case jsonConversionFailure //(description: String)
    case jsonParsingFailure
    case failedSerialization
    case noInternet
}

//extension NetworkError {
//    public var errorDescription: String {
//        switch self {
//        case let .requestFailed(description): return "Request Failed: \(description)"
//        case .invalidData: return "Invalid Data"
//        case .invalidUrl: return "Invalid Url"
//        case let .invalidResponse(description): return "Unsuccessful: \(description)"
//        case let .jsonConversionFailure(description): return "JSON Conversion Failure: \(description)"
//        case .jsonParsingFailure: return "JSON Parsing Failure"
//        case .failedSerialization: return "Serialization failed."
//        case .noInternet: return "No internet connection"
//        }
//    }
//}
