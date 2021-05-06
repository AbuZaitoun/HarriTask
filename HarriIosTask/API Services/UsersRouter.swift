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
    
    /// Base url string for user info
    static let baseUserInfoURLString = "https://api.harridev.com/api/v1"
    
    /// Base url
    var usersListURL: URL {
        return URL(string: UsersRouter.baseUserListURLString)!
    }
    
    /// User info url
    var userInfoURL: URL {
        return URL(string: UsersRouter.baseUserInfoURLString)!
    }
    
    /// Read users
    case readUsers(params: Parameters)
    
    /// User info
    case userInfo(userID: String)
    
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
    func path() -> String {
        switch self {
        case .readUsers:
            return "search_users"
        case .userInfo(let userID):
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
            url = usersListURL.appendingPathComponent(path())
        case .userInfo(_):
            url = userInfoURL.appendingPathComponent(path())
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case let .readUsers(parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .userInfo(_):
            break
        }
        
//        print(urlRequest.headers)
        return urlRequest
    }
    
}
