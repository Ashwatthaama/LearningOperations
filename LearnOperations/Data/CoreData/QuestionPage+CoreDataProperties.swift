//
//  QuestionPage+CoreDataProperties.swift
//  LearnOperations
//
//  Created by Niraj on 17/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//
//

import Foundation
import CoreData


extension QuestionPage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<QuestionPage> {
        return NSFetchRequest<QuestionPage>(entityName: "QuestionPage")
    }

    @NSManaged public var hasMore: Bool
    @NSManaged public var questions: Set<Question>

}

// MARK: Generated accessors for questions
extension QuestionPage {

    @objc(addQuestionsObject:)
    @NSManaged public func addToQuestions(_ value: Question)

    @objc(removeQuestionsObject:)
    @NSManaged public func removeFromQuestions(_ value: Question)

    @objc(addQuestions:)
    @NSManaged public func addToQuestions(_ values: NSSet)

    @objc(removeQuestions:)
    @NSManaged public func removeFromQuestions(_ values: NSSet)

}
