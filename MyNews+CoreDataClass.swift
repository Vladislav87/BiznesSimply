//
//  MyNews+CoreDataClass.swift
//  SimplifyingBusiness
//
//  Created by Владислав Ходеев on 07.01.17.
//  Copyright © 2017 Vlad Samoilov. All rights reserved.
//

import Foundation
import CoreData


public class MyNews: NSManagedObject {

    convenience init() {
        self.init(entity: Manager.instance.entityForName("MyNews"), insertInto: Manager.instance.managedObjectContext)
    }
    
}
