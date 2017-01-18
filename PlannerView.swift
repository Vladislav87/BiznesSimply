//
//  PlannerView.swift
//  SimplifyingBusiness
//
//  Created by Владислав Ходеев on 04.01.17.
//  Copyright © 2017 Vlad Samoilov. All rights reserved.
//

import UIKit

class PlannerView: UIViewController {
    
    
    @IBOutlet weak var taskField: UITextField!
    
    @IBOutlet weak var dayField: UITextField!
    
    @IBOutlet weak var monthField: UITextField!
    
    @IBOutlet weak var yearField: UITextField!
    
    @IBOutlet weak var detailsAboutTaskTextView: UITextView!
    
    
    var task: MyPlanners?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let newTask = task {
            taskField.text = newTask.task
            dayField.text = newTask.day
            monthField.text = newTask.month
            yearField.text = newTask.year
            detailsAboutTaskTextView.text = newTask.aboutTask
            
        }
        

    }

  
    @IBAction func cancel(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)

    }
    
    @IBAction func save(_ sender: Any) {
        if saveEmployee(){
            dismiss(animated: true, completion: nil)
        }
        
        
        
        
    }
    
    
    func saveEmployee() -> Bool {
        // Validation of required fields
        if taskField.text!.isEmpty {
            let alert = UIAlertController(title: "Ошибка ввода", message: "Поле (Дело) не может быть пустым!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            view.backgroundColor = UIColor.red
            
            return false
        }
        //create object
        if task == nil {
            task = MyPlanners()
        }
        
        //saving object
        if let newTask2 = task {
            newTask2.task = taskField.text
            newTask2.day = dayField.text
            newTask2.month = monthField.text
            newTask2.year = yearField.text
            newTask2.aboutTask = detailsAboutTaskTextView.text
            
            Manager.instance.saveContext()
            
            
        }
        
        return true
        
    }
    
    
    
    
    
    
}
