//
//  MyPlanners+CoreDataClass.swift
//  SimplifyingBusiness
//
//  Created by Владислав Ходеев on 04.01.17.
//  Copyright © 2017 Vlad Samoilov. All rights reserved.
//

import Foundation
import CoreData


public class MyPlanners: NSManagedObject {

    
    convenience init() {
        self.init(entity: Manager.instance.entityForName("MyPlanners"), insertInto: Manager.instance.managedObjectContext)
    }
    
    
}
