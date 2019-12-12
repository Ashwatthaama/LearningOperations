//
//  User.swift
//  LearnOperations
//
//  Created by Niraj on 12/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//
import Foundation

struct User: Codable, Equatable {
    
    let userID: Int
    let name: String
    let avatarURL: String
    
    // MARK: - CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case name = "display_name"
        case avatarURL = "profile_image"
    }
    
    // MARK: - Equatable
    
    static func ==(lhs: User, rhs: User) -> Bool {
        return lhs.userID == rhs.userID &&
            lhs.name == rhs.name &&
            lhs.avatarURL == rhs.avatarURL
    }
}
