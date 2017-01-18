//
//  FirstRSSView.swift
//  SimplifyingBusiness
//
//  Created by Владислав Ходеев on 18.01.17.
//  Copyright © 2017 Vlad Samoilov. All rights reserved.
//

import UIKit

class FirstRSSView: UIViewController {
    
    let feedModel: ParserModel = ParserModel()
    var webpage: [WebPage] = [WebPage]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
self.feedModel.getWebPage()
    }

   

}
