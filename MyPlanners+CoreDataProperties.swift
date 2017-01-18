//
//  MyPlanners+CoreDataProperties.swift
//  SimplifyingBusiness
//
//  Created by Владислав Ходеев on 04.01.17.
//  Copyright © 2017 Vlad Samoilov. All rights reserved.
//

import Foundation
import CoreData


extension MyPlanners {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyPlanners> {
        return NSFetchRequest<MyPlanners>(entityName: "MyPlanners");
    }

    @NSManaged public var day: String?
    @NSManaged public var month: String?
    @NSManaged public var task: String?
    @NSManaged public var year: String?
    @NSManaged public var aboutTask: String?

}
