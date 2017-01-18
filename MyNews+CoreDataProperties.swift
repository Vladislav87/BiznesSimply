//
//  MyNews+CoreDataProperties.swift
//  SimplifyingBusiness
//
//  Created by Владислав Ходеев on 07.01.17.
//  Copyright © 2017 Vlad Samoilov. All rights reserved.
//

import Foundation
import CoreData


extension MyNews {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyNews> {
        return NSFetchRequest<MyNews>(entityName: "MyNews");
    }

    @NSManaged public var newstext: String?
    @NSManaged public var photo: NSData?
    @NSManaged public var title: String?

}
