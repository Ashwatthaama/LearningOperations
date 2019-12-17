//
//  Question+CoreDataClass.swift
//  LearnOperations
//
//  Created by Niraj on 17/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Question)
public class Question: NSManagedObject, Codable {

    enum CodingKeys: String, CodingKey {
        case questionID = "question_id"
        case title = "title"
        case user = "owner"
    }

    public func encode(to encoder:Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        do {
            try container.encode(questionID, forKey: .questionID)
            try container.encode(title, forKey: .title)
            try container.encode(user, forKey: .user)
        } catch {
            print("Encoding Questions Error,\(error)")
        }

    }

    required convenience public init(from decoder: Decoder) throws {

        guard let managedObjectContext = decoder.userInfo[.context] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "Question", in: managedObjectContext) else {
                fatalError("Failed to decode Question")
        }
        self.init(entity: entity, insertInto: managedObjectContext)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        do {
            questionID = try values.decode(Int32.self, forKey: .questionID)
            title = try values.decode(String.self, forKey: .title)
            user = try values.decode(User.self, forKey: .user)
        } catch {
            print("Error while decoding,\(error)")
        }
    }
}
