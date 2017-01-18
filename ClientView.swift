//
//  ClientView.swift
//  SimplifyingBusiness
//
//  Created by Владислав Ходеев on 24.12.16.
//  Copyright © 2016 Vlad Samoilov. All rights reserved.
//

import UIKit

class ClientView: UIViewController {
    
    var client: MyClients?

    
    @IBOutlet weak var nameClientField: UITextField!
    
    @IBOutlet weak var iinField: UITextField!
    
    @IBOutlet weak var siteField: UITextField!
    
    @IBOutlet weak var phoneField: UITextField!
    
    @IBOutlet weak var infoText: UITextView!
    
    @IBOutlet weak var ringingButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let customer = client {
            nameClientField.text = customer.name
            iinField.text = customer.iin
            siteField.text = customer.site
            phoneField.text = customer.phone
            infoText.text = customer.typeBusiness

            
        }
        
        ringingButton.layer.cornerRadius = ringingButton.frame.width/2
        ringingButton.clipsToBounds = true
        ringingButton.layer.borderColor = UIColor.green.cgColor
        ringingButton.layer.borderWidth = 2

    }

    @IBAction func callNumber(_ sender: AnyObject){
        callToClient(phoneNumb: phoneField.text!)
    }
    
    func callToClient(phoneNumb: String){
        if let url = URL(string: "tel://\(phoneNumb)"){
            if #available(iOS 10, *){
                UIApplication.shared.open(url, options:[:], completionHandler: { (success) in
                    print(success)
                })
            }else {
                let success = UIApplication.shared.openURL(url)
                print(success)
            }
        }
    }
    

    @IBAction func saveNewClient(_ sender: AnyObject) {
        
        if saveClient() {
            dismiss(animated: true, completion: nil)
        }
    }
   
    @IBAction func cancel(_ sender: AnyObject) {
        
        dismiss(animated: true, completion: nil)

    }
    
    func saveClient() -> Bool {
        // Validation of required fields
        if nameClientField.text!.isEmpty {
            let alert = UIAlertController(title: "Validation error", message: "Input the name of the Customer!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false
        }
        // Creating object
        if client == nil {
            client = MyClients()
        }
        // Saving object
        if let customer = client {
//            customer.name = nameTextField.text
//            customer.info = infoTextField.text
            customer.name = nameClientField.text
            customer.iin = iinField.text
            customer.site = siteField.text
            customer.phone = phoneField.text
            customer.typeBusiness = infoText.text
            
            Manager.instance.saveContext()
        }
        return true
    }

}
