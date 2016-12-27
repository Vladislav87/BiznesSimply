//
//  Calculation.swift
//  SimplifyingBusiness
//
//  Created by Владислав Ходеев on 24.12.16.
//  Copyright © 2016 Vlad Samoilov. All rights reserved.
//

import Foundation

class Calculation {
    func Count(_ hours:String, costOfHour: String ) -> String{
        
        let val1: Float = NSString(string: hours).floatValue
        let val2: Float = NSString(string: costOfHour).floatValue
        
        let costOfService:Float = val1 * val2
        
        let transformToString:String = NSString(format: "%f", costOfService) as String
        
        
        return transformToString

    }
}
