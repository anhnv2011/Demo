//
//  User+CoreDataProperties.swift
//  DemoCoreData
//
//  Created by MAC on 7/28/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: String?
    @NSManaged public var adress: String?
    @NSManaged public var phone: String?

}

extension User : Identifiable {

}
