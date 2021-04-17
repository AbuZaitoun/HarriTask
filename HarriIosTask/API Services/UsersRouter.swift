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
    static let baseUserListURLString = "https://gateway.harridev.com/core/api/v1/harri_search"
    static let baseUserInfoURLString = "https://api.harridev.com/api/v1"
    /// Base url
    var usersListURL: URL {
        return URL(string: UsersRouter.baseUserListURLString)!
    }
    
    var userInfoURL: URL {
        return URL(string: UsersRouter.baseUserInfoURLString)!
    }
    
    /// Read users
    case readUsers(params: Parameters)
    
    /// User info
    case userInfo(params: Parameters, userID: String)
    
    /// Method
    var method: HTTPMethod {
        switch self {
        case .readUsers:
            return .post
        case .userInfo:
            return .get
        }
    }
    
    /// Path
    func path(userID: String) -> String {
        switch self {
        case .readUsers:
            return "search_users"
        case .userInfo:
            return "profile/member/\(userID)"
        }
    }
    
    // MARK: - URLRequestConvertable conformance
    
    /**
     As url request
     - throws
     - returns URLRequest
     */
    func asURLRequest() throws -> URLRequest {
        
        var url: URL
        switch self {
        case .readUsers(_):
            url = usersListURL.appendingPathComponent(path(userID: ""))
        case let .userInfo(_, userID):
            url = userInfoURL.appendingPathComponent(path(userID: userID))
            
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case let .readUsers(parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .userInfo(_, _):
            break
        }
        print(urlRequest)
        return urlRequest
    }
    
}
