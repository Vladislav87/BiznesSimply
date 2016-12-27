//
//  ServiceView.swift
//  SimplifyingBusiness
//
//  Created by Владислав Ходеев on 24.12.16.
//  Copyright © 2016 Vlad Samoilov. All rights reserved.
//

import UIKit
import MessageUI

class ServiceView: UIViewController,MFMailComposeViewControllerDelegate {
    
    
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var costField: UITextField!
    @IBOutlet weak var salesName: UITextField!
    @IBOutlet weak var aboutService: UITextView!
    var costString = ""
//Для подсчета стоимости
    var resultCost = ""
    @IBOutlet weak var hour: UITextField!
    @IBOutlet weak var costOfHour: UITextField!
    
    
    
    //КНОПКА "ПОСЧИТАТЬ"
    @IBAction func calculateService(_ sender: AnyObject){
        let myCalculate = Calculation()
        
        
        self.resultCost = myCalculate.Count(hour.text!, costOfHour: costOfHour.text!)
        costField.text = resultCost
        
      costString = resultCost
        
        
    }

    @IBAction func sendEmail(_ sender: Any) {
        
        let title = "Рассчет стоимости услуги \(name.text). "
        let messageBody = "Услуга \(name.text) для Вашей компании стоит \(costField.text)"
        let recipient = [" "]
        
        let mc = MFMailComposeViewController()
        mc.mailComposeDelegate = self
        mc.setSubject(title)
        mc.setMessageBody(messageBody, isHTML: false)
        mc.setToRecipients(recipient)
        
        present(mc, animated: true, completion: nil)
        
        
        
        
        
        
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case .cancelled:
            print("Письмо отменено")
            break
        case .saved:
            print("Письмо сохранено")
            break
        case .sent:
            print("Письмо отправлено")
            break
        case .failed:
            print("Письмо не отправлено: ошибка!")
            break

     //   default:
            
        //    break
            
        }
        dismiss(animated: true, completion: nil)
        
    }
    

    @IBAction func cancel(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: AnyObject) {
        if saveService() {
            dismiss(animated: true, completion: nil)
        }
    }
    
   
    //
    @IBAction func changeSalesManager(_ sender:AnyObject){
        
    }
    
    var service: MyServices?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Reading object
        if let service = service {
            
            
            
            name.text = service.name
            costField.text = service.cost
            salesName.text = service.nameSalesManager
            aboutService.text = service.about
            


            
        }
    }
    
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.costField.text = costString

    }
    
    
    func saveService() -> Bool {
        // Validation of required fields
        if name.text!.isEmpty {
            let alert = UIAlertController(title: "Ошибка ввода", message: "Поле (Услуга) не может быть пустым!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            view.backgroundColor = UIColor.red

            return false
        }
        
        // Creating object
        if service == nil {
            service = MyServices()
        }
        
        // Saving object
        if let service = service {
            service.name = name.text
            service.about = aboutService.text
            service.nameSalesManager = salesName.text
            service.cost = costField.text
            service.cost = costString
            
            Manager.instance.saveContext()
        }
        return true
    }
}
