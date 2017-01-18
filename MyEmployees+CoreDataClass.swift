//
//  MyEmployees+CoreDataClass.swift
//  SimplifyingBusiness
//
//  Created by Владислав Ходеев on 30.12.16.
//  Copyright © 2016 Vlad Samoilov. All rights reserved.
//

import Foundation
import CoreData


public class MyEmployees: NSManagedObject {

    
    convenience init() {
        self.init(entity: Manager.instance.entityForName("MyEmployees"), insertInto: Manager.instance.managedObjectContext)
    }
}
