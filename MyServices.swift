//
//  MyServices.swift
//  SimplifyingBusiness
//
//  Created by Владислав Ходеев on 24.12.16.
//  Copyright © 2016 Vlad Samoilov. All rights reserved.
//

import Foundation
import CoreData


class MyServices: NSManagedObject {

    convenience init() {
        self.init(entity: Manager.instance.entityForName("MyServices"), insertInto: Manager.instance.managedObjectContext)
    }
}
