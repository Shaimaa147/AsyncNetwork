//
//  File.swift
//  
//
//  Created by Shaimaa Mohammed on 20/03/2024.
//

import Foundation

public class BaseResponse<T: Codable>: Codable {
    var status: String?
    var data: T?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
    }
}
