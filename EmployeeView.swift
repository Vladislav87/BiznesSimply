//
//  EmployeeView.swift
//  SimplifyingBusiness
//
//  Created by Владислав Ходеев on 30.12.16.
//  Copyright © 2016 Vlad Samoilov. All rights reserved.
//

import UIKit

class EmployeeView: UIViewController {
    
    
    //outlets main view
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var post: UITextField!
    @IBOutlet weak var expirience: UITextField!
    @IBOutlet weak var salaryField: UITextField!
    
    var salaryString = ""
    var itogoString = ""
       //outlets second view
    @IBOutlet weak var basicSalary: UITextField!
    @IBOutlet weak var allDays: UITextField!
    @IBOutlet weak var worksDays: UITextField!
    @IBOutlet weak var tax: UITextField!

    
    
    //object
    var employee: MyEmployees?
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let employee = employee {
            name.text = employee.name
            lastname.text = employee.lastname
            post.text = employee.post
            expirience.text = employee.experience
            salaryField.text = employee.salary
            
        }

    }
    


    //save and cancel action
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
  
    @IBAction func save(_ sender: Any) {
        if saveEmployee(){
            dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    
    //count salary
    
    @IBAction func CountMySalary(_ sender: Any) {
        let calculateMySalary = Salary()
      self.itogoString =  calculateMySalary.countSalary(salary: basicSalary.text!, alldays: allDays.text!, worksDays: worksDays.text!, tax: tax.text!)
        
        salaryField.text = itogoString
        salaryString = itogoString
        
        
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        self.itogo.text = salaryString
//        
//    }
    
    
    func saveEmployee() -> Bool {
        // Validation of required fields
        if name.text!.isEmpty {
            let alert = UIAlertController(title: "Ошибка ввода", message: "Поле (Услуга) не может быть пустым!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            view.backgroundColor = UIColor.red
            
            return false
        }
        //create object 
        if employee == nil {
            employee = MyEmployees()
        }
        
        //saving object
        if let employ = employee {
            employ.name = name.text
            employ.lastname = lastname.text
            employ.post = post.text
            employ.experience = expirience.text
            employ.salary = salaryField.text
            
            Manager.instance.saveContext()
            
            
        }
        
        return true

    }

    
}
