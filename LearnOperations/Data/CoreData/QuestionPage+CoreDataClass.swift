//
//  QuestionPage+CoreDataClass.swift
//  LearnOperations
//
//  Created by Niraj on 17/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//
//

import Foundation
import CoreData

extension CodingUserInfoKey {
    static let context = CodingUserInfoKey(rawValue: "context")!
}

enum EventDecodeError: Error {
    case contextNotFound
    case entityNotFound
}

extension JSONDecoder {
    convenience init(context: NSManagedObjectContext) {
        self.init()
        self.userInfo[.context] = context
    }
}


@objc(QuestionPage)
public class QuestionPage: NSManagedObject, Codable {

    enum CodingKeys: String, CodingKey {
        case hasMore = "has_more"
        case questions = "items"
    }

    public func encode(to encoder:Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        do {
            try container.encode(hasMore, forKey: .hasMore)
        } catch {
            print("Encoding Questions Error,\(error)")
        }

    }

    required convenience public init(from decoder: Decoder) throws {

        guard let managedObjectContext = decoder.userInfo[.context] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "QuestionPage", in: managedObjectContext) else {
                fatalError("Failed to decode QuestionPage")
        }
        self.init(entity: entity, insertInto: managedObjectContext)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        do {
            questions = try values.decode(Set<Question>.self, forKey: .questions)
            questions.forEach{ $0.question = self }
            hasMore = try values.decode(Bool.self, forKey: .hasMore)
        } catch {
            print("Error while decoding,\(error)")
        }
    }
}
