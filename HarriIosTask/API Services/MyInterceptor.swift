//
//  MyInterceptor.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 13/04/2021.
//

import Alamofire

/// My Interceptor
class MyInterceptor: RequestInterceptor {
    
    /// Max tries
    private let MAX_TRIES = 2
    
    // MARK: - RequestInterceptor conformance
    
    /**
    Retry
     - Parameter request: Request
     - Parameter session: Session
     - Parameter error: Error
     - Parameter completion: (RetryRequest) -->  Void
     */
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        if request.retryCount < self.MAX_TRIES {
            completion(.retryWithDelay(1))
        } else {
            completion(.doNotRetry)
        }
    }
}
