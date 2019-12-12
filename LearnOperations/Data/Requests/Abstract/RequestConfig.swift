//
//  RequestConfig.swift
//  LearnOperations
//
//  Created by Niraj on 12/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//

import Foundation

enum HTTPRequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

class RequestConfig {
    
    let APIHost: String
    
    // MARK: - Init
    
    init() {
        self.APIHost = "https://api.stackexchange.com/2.2"
    }
}
