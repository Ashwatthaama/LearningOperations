//
//  User+CoreDataProperties.swift
//  LearnOperations
//
//  Created by Niraj on 17/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var avatarURL: String
    @NSManaged public var name: String
    @NSManaged public var userID: Int32

}
