//
//  UserRouter.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 06/04/2021.
//

import Alamofire
import Foundation
import UIKit

/// User Router
enum UsersRouter: URLRequestConvertible {
    
    /// Base url string
    static let baseURLString = "https://gateway.harridev.com/core/api/v1/harri_search"
    
    /// Base url
    var baseURL: URL {
        return URL(string: UsersRouter.baseURLString)!
        }
    
    /// Read users
    case readUsers(params: Parameters)
    
    /// Method
    var method: HTTPMethod {
        switch self {
        case .readUsers:
            return .post
        }
    }
    
    /// Path
    var path: String {
        switch self {
        case .readUsers:
            return "search_users"
        }
    }

    // MARK: - URLRequestConvertable conformance
    
    /**
     As url request
     - throws
     - returns URLRequest
     */
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
