//
//  SalatyModel.swift
//  SimplifyingBusiness
//
//  Created by Владислав Ходеев on 30.12.16.
//  Copyright © 2016 Vlad Samoilov. All rights reserved.
//

import Foundation


class Salary {
    
    func countSalary(salary:String, alldays: String, worksDays: String, tax: String) -> String {
        
        let value1: Double = NSString(string: salary).doubleValue
        let value2: Double = NSString(string: alldays).doubleValue
        let value3: Double = NSString(string: worksDays).doubleValue
        var value4: Double = NSString(string: tax).doubleValue
        value4 = (value1/value2)*value3 * 13/100
        
        let currentSalary: Double = (value1/value2)*value3 - value4
        
        let transformToString: String = NSString(format: "%2f", currentSalary) as String
        
        
        return transformToString
        
        
        
        
        
        
    }
}
