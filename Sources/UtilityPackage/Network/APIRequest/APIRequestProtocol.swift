//
//  File.swift
//  
//
//  Created by Shaimaa Mohammed on 19/03/2024.
//

import Foundation
public protocol APIRequestProtocol {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    //The type of HTTP task to be performed.
//    var task: Task { get }
    var headers: [String: String]? { get }
    
//    func buildParams(task: Task) -> ([String:String])?
}

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

//public enum Task {
//    case requestPlain
//    case requestParameters(parameters: [String: String])
//}
