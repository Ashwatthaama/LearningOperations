//
//  User+CoreDataClass.swift
//  LearnOperations
//
//  Created by Niraj on 17/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject, Codable {

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case name = "display_name"
        case avatarURL = "profile_image"
    }

    public func encode(to encoder:Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        do {
            try container.encode(userID, forKey: .userID)
            try container.encode(name, forKey: .name)
            try container.encode(avatarURL, forKey: .avatarURL)
        } catch {
            print("Encoding User Error,\(error)")
        }

    }

    required convenience public init(from decoder: Decoder) throws {

        guard let managedObjectContext = decoder.userInfo[.context] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "User", in: managedObjectContext) else {
                fatalError("Failed to decode User")
        }
        self.init(entity: entity, insertInto: managedObjectContext)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        do {
            name = try values.decode(String.self, forKey: .name)
            avatarURL = try values.decode(String.self, forKey: .avatarURL)
            userID = try values.decode(Int32.self, forKey: .userID)
        } catch {
            print("Error while decoding,\(error)")
        }
    }
}
