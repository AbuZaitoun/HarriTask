//
//  MyInterceptor.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 13/04/2021.
//

import Alamofire

class MyInterceptor: RequestInterceptor {
    
    private let MAX_TRIES = 2
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        if request.retryCount < self.MAX_TRIES {
            completion(.retryWithDelay(1))
        } else {
            completion(.doNotRetry)
        }
    }
}
