//
//  MyClients+CoreDataProperties.swift
//  SimplifyingBusiness
//
//  Created by Владислав Ходеев on 24.12.16.
//  Copyright © 2016 Vlad Samoilov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension MyClients {

    @NSManaged var name: String?
    @NSManaged var iin: String?
    @NSManaged var typeBusiness: String?
    @NSManaged var email: String?
    @NSManaged var phone: String?
    @NSManaged var site: String?
    @NSManaged var service: MyServices?

}
