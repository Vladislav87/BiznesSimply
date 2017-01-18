//
//  EmailValidationModel.swift
//  
//
//  Created by Владислав Ходеев on 11.01.17.
//
//

import Foundation


class Validation {
    func validEmail(email: String) -> Bool{
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
}
