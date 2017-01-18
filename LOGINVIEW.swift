//
//  LOGINVIEW.swift
//  SimplifyingBusiness
//
//  Created by Владислав Ходеев on 08.01.17.
//  Copyright © 2017 Vlad Samoilov. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth



class LOGINVIEW: UIViewController {
    
    @IBOutlet weak var companyNameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    
    @IBOutlet weak var enterButton: UIButton!
    
    @IBOutlet weak var startPlanningButton: UIButton!
    
    @IBOutlet weak var ifNoAccount: UILabel!
    
    let validateMe = Validation()
    
    
    var timer: Timer?
    var degree = CGFloat(M_PI / 60)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        enterButton.layer.cornerRadius = 19
        enterButton.clipsToBounds = true
        enterButton.layer.borderWidth = 2
        enterButton.layer.borderColor = UIColor.black.cgColor

        
        
        startPlanningButton.layer.cornerRadius = 19
        startPlanningButton.clipsToBounds = true
        startPlanningButton.layer.borderWidth = 2
        startPlanningButton.layer.borderColor = UIColor.black.cgColor
        
        
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(LOGINVIEW.rotate), userInfo: nil, repeats: true)
        
        
        
        
//
//
//        UIButton.animate(withDuration: 0.8, delay: 0.9, options: [.repeat,.beginFromCurrentState,.autoreverse], animations: { 
//            self.startPlanningButton.frame = CGRect(x: 50, y: 535, width: 280, height: 25)
//        }, completion: nil)
        
        
        
        
        
        
    }

    
    
    
    func rotate(){
        
       
        
        
      self.enterButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        
        UIButton.animateKeyframes(withDuration: 1.3, delay: 0, options: [.autoreverse], animations: {
            
            self.enterButton.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            
            


        }) { finished in
            self.timer?.invalidate()
          self.enterButton.transform = CGAffineTransform(scaleX: 1, y: 1)

        }

}
    
    func timerAction1() {
        self.timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector:#selector(self.timerAction1), userInfo: nil, repeats: true)

    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        self.enterButton.layer.removeAllAnimations()


    }
    
    
    @IBAction func loginMe(_ sender: Any) {
        
        FIRAuth.auth()?.signIn(withEmail: emailField.text!, password: passwordField.text!, completion: { (user, error) in
            if error != nil {
                
                print("вход не  удался")
                let alertError = UIAlertController(title: "Сообщение:", message: "Проверьте емейл или пароль", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertError.addAction(ok)
                self.present(alertError, animated: true, completion: nil)
                
                

            }
            else {
              
                print("Вход  удался")
                self.performSegue(withIdentifier: "fromLogingToMenu", sender: nil)

            }
        })
        
        if validateMe.validEmail(email: emailField.text!){
            
        }else if !validateMe.validEmail(email: emailField.text!){
            let alertError = UIAlertController(title: "Сообщение:", message: "Проверьте емейл.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertError.addAction(ok)
            self.present(alertError, animated: true, completion: nil)
            print("Проверьте емейл")
        }
     
        
        

    }
    
    
    
    
    
}
