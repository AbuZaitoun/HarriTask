//
//  UserRouter.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 06/04/2021.
//

import Alamofire
import Foundation
import UIKit

enum UserRouter: URLRequestConvertible {
    
    static let baseURLString = "https://gateway.harridev.com/core/api/v1/harri_search"
    
    var baseURL: URL {
        return URL(string: UserRouter.baseURLString)!
        }
    
    case readUsers(params: Parameters)
    
    var method: HTTPMethod {
        switch self {
        case .readUsers:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .readUsers:
            return "search_users"
        }
    }

    func asURLRequest() throws -> URLRequest {
        
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
                
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue

        switch self {
            case let .readUsers(parameters):
                urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
            break
        }
        print(urlRequest)
        return urlRequest
    }
    
}
