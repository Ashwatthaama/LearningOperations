//
//  QuestionsURLRequestFactory.swift
//  LearnOperations
//
//  Created by Niraj on 12/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//

import Foundation

class QuestionsURLRequestFactory: URLRequestFactory {
    
    // MARK: - Retrieval
    
    func requestToRetrieveQuestions(pageIndex: Int) -> URLRequest {
        var urlString = "questions?order=desc&sort=activity&tagged=ios&pagesize=30&site=stackoverflow"
        
        if pageIndex != 0 {
            urlString += "&page=\(pageIndex)"
        }
        
        var request = jsonRequest(endPoint: urlString)
        request.httpMethod = HTTPRequestMethod.get.rawValue
        
        return request
    }
}
