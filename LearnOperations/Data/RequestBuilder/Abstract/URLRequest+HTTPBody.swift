//
//  URLRequest+HTTPBody.swift
//  LearnOperations
//
//  Created by Niraj on 12/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//

import Foundation

extension URLRequest {
    
    // MARK: - JSON
    
    mutating func setJSONParameters(_ parameters: [String: Any]?) {
        guard let parameters = parameters else {
            httpBody = nil
            return
        }
        
        httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: JSONSerialization.WritingOptions(rawValue: 0))
    }
}
