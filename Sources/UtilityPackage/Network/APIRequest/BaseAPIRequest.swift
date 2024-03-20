//
//  File.swift
//
//
//  Created by Shaimaa Mohammed on 19/03/2024.
//

import Foundation

open class BaseAPIRequest: APIRequestProtocol {
    public var baseURL: String
    
    public var path: String
    
    public var method: HTTPMethod
    
    public var task: Task
    
    public var headers: [String : String]?
    
//    public func buildParams(task: Task) -> ([String : Any])?
    
    public init(){
        baseURL = ""
        path = ""
        method = .get
        headers = ["Content-Type": "application/json"]
        task = .requestPlain
    }
    
    
}
