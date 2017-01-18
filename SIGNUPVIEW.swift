//
//  SIGNUPVIEW.swift
//  SimplifyingBusiness
//
//  Created by Владислав Ходеев on 08.01.17.
//  Copyright © 2017 Vlad Samoilov. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SIGNUPVIEW: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lastNameField: UITextField!
    
    @IBOutlet weak var companyField: UITextField!
    
    @IBOutlet weak var businessType: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    

  
  
    

    }
    @IBAction func cancel(_ sender: AnyObject) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func createBP(_ sender: Any) {
        
        FIRAuth.auth()?.createUser(withEmail: emailField.text!, password: passwordField.text!, completion: { (user, error) in
            if error != nil {
                
                print("Регистрация не удалась")
                let alertError = UIAlertController(title: "Сообщение:", message: "Проверьте емейл или пароль", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertError.addAction(ok)
                self.present(alertError, animated: true, completion: nil)

                
            }else {
                
                print("Регистрация удалась")
               self.performSegue(withIdentifier: "signToMenu", sender: nil)
                
                
            }
        })
        
     
    }
    
    
    
//    func login ()  {
//        FIRAuth.auth()?.signIn(withEmail: emailField.text!, password: passwordField.text!, completion: { (user, error) in
//            if error != nil {
//                
//                print("функция login is ok")
//                
//            }
//            else {
//               print("Функция login is crash")
//            }
//        })
//    }
    
}
