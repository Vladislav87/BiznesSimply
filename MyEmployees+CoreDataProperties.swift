//
//  MyEmployees+CoreDataProperties.swift
//  SimplifyingBusiness
//
//  Created by Владислав Ходеев on 30.12.16.
//  Copyright © 2016 Vlad Samoilov. All rights reserved.
//

import Foundation
import CoreData


extension MyEmployees {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyEmployees> {
        return NSFetchRequest<MyEmployees>(entityName: "MyEmployees");
    }

    @NSManaged public var experience: String?
    @NSManaged public var lastname: String?
    @NSManaged public var name: String?
    @NSManaged public var post: String?
    @NSManaged public var salary: String?

}
