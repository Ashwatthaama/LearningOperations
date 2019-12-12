//
//  Question.swift
//  LearnOperations
//
//  Created by Niraj on 12/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//

import Foundation

struct QuestionPage: Codable {
    
    let questions: [Question]
    let hasMore: Bool
    
    // MARK: - CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case questions = "items"
        case hasMore = "has_more"
    }
    
    // MARK: - Init
    
    init(from decoder: Decoder) throws {        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        questions = try container.decodeArrayByIgnoringInvalidElements(Question.self, forKey: .questions)
        hasMore = try container.decode(Bool.self, forKey: .hasMore)
    }
}

struct Question: Codable {
    
    let questionID: Int
    let title: String
    let user: User
    
    // MARK: - CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case questionID = "question_id"
        case title = "title"
        case user = "owner"
    }
}
