//
//  NewsView.swift
//  SimplifyingBusiness
//
//  Created by Владислав Ходеев on 04.01.17.
//  Copyright © 2017 Vlad Samoilov. All rights reserved.
//

import UIKit
import CoreData
import Social

class NewsView: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    
    var imagePicker: UIImagePickerController!
    
    @IBOutlet weak var newsPhoto: UIImageView!
    
    @IBOutlet weak var newsTitle: UITextField!
    
    @IBOutlet weak var newsTextView: UITextView!
    
    
    
    var news: MyNews!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let news1 = news{
            newsTitle.text = news1.title
            newsPhoto.image = UIImage(data: news1.photo as! Data)
            
            
            newsTextView.text = news1.newstext
            
            
            
            
        }
        
        
        
        
        

    }

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
   
    @IBAction func save(_ sender: Any) {
        if saveNews(){
            dismiss(animated: true, completion: nil)
        }
        
    }
    
  
    
    
    @IBAction func shootOrChoosePhoto(_ sender: Any) {
        
        let alert = UIAlertController(title: "Фото:", message: "Камера или фото-библиотека.", preferredStyle: .alert)
        
        let cameraAction = UIAlertAction(title: "Камера", style: .default) { (action:UIAlertAction) in
            self.imagePicker = UIImagePickerController()
            self.imagePicker.delegate = self
            self.imagePicker.sourceType = .camera
            self.imagePicker.allowsEditing = true
            
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        let libraryAction = UIAlertAction(title: "Библиотека", style: .default) { (action: UIAlertAction) in
            self.imagePicker = UIImagePickerController()
            self.imagePicker.delegate = self
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.allowsEditing = true
            
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        
        alert.addAction(cameraAction)
        alert.addAction(libraryAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        newsPhoto.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
    
    
    
    @IBAction func shareToTwitter(_ sender: Any) {
        let shareToTwitter: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        shareToTwitter.add(newsPhoto.image!)
        shareToTwitter.setInitialText(newsTitle.text)
        self.present(shareToTwitter, animated: true, completion: nil)
    }
    
    @IBAction func shareToFacebook(_ sender: Any) {
        
        let shareToFB: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        shareToFB.add(newsPhoto.image!)
        shareToFB.setInitialText(newsTitle.text)
        self.present(shareToFB, animated: true, completion: nil)
        
        
        
    }
    
   
    
    func saveNews() -> Bool {
        // Validation of required fields
        if newsTitle.text!.isEmpty {
            let alert = UIAlertController(title: "Ошибка ввода", message: "Поле (Заголовок) не может быть пустым!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            view.backgroundColor = UIColor.red
            
            return false
        }
        //create object
        if news == nil {
            news = MyNews()
        }
        
        //saving object
        if let news2 = news {
            news2.title = newsTitle.text
            news2.newstext = newsTextView.text
          
       news2.photo =  UIImageJPEGRepresentation(newsPhoto.image!, 1) as NSData?  // news2.value(forKey: "photo") as! NSData?

            
            
            Manager.instance.saveContext()
            
            
        }
        
        return true
        
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
