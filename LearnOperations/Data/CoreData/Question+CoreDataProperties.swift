//
//  Question+CoreDataProperties.swift
//  LearnOperations
//
//  Created by Niraj on 17/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//
//

import Foundation
import CoreData


extension Question {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Question> {
        return NSFetchRequest<Question>(entityName: "Question")
    }

    @NSManaged public var questionID: Int32
    @NSManaged public var title: String
    @NSManaged public var question: QuestionPage
    @NSManaged public var user: User

}
