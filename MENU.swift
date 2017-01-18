//
//  MENU.swift
//  SimplifyingBusiness
//
//  Created by Владислав Ходеев on 08.01.17.
//  Copyright © 2017 Vlad Samoilov. All rights reserved.
//

import UIKit

class MENU: UIViewController {

    @IBOutlet weak var mainMenuView: UIView!
    
    @IBOutlet weak var menuBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // self.mainMenuView.isHidden = true
        
        menuBtn.layer.cornerRadius = menuBtn.frame.size.width / 2
        menuBtn.clipsToBounds = true
        menuBtn.layer.borderColor = UIColor.black.cgColor
        menuBtn.layer.borderWidth = 2
        

        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func toNews(_ sender: AnyObject){
        self.performSegue(withIdentifier: "menuToNews", sender: nil)
    }
    
    @IBAction func toClients(_ sender: AnyObject){
        self.performSegue(withIdentifier: "menuToClients", sender: nil)
    }
    @IBAction func toPlanner(_ sender: AnyObject){
        self.performSegue(withIdentifier: "menuToPlanner", sender: nil)
    }
    @IBAction func toServices(_ sender: AnyObject){
        self.performSegue(withIdentifier: "menuToServices", sender: nil)
    }
    @IBAction func toCalculator(_ sender: AnyObject){
        self.performSegue(withIdentifier: "menuToCalculator", sender: nil)
    }
    @IBAction func toEmployee(_ sender: AnyObject){
        self.performSegue(withIdentifier: "menuToEmployee", sender: nil)
    }

   
    
    @IBAction func cancel(_ sender: AnyObject) {
        
        dismiss(animated: true, completion: nil)
        
    }
   
    
    @IBAction func menu(_ sender: Any) {
        
        if mainMenuView.isHidden == false {
            self.mainMenuView.isHidden = true
            
        }
        else {
            self.mainMenuView.isHidden = false
            UIView.animate(withDuration: 1, delay: 0, options: [.transitionFlipFromBottom,.transitionCrossDissolve], animations: {
                //self.mainMenuView.frame = CGRect(x: 0, y: 0, width: 375, height: 557)
                self.menuBtn.isHidden = false
            }, completion: nil)
            
        }
        
    }
    
    }
    
    
    
    
  




