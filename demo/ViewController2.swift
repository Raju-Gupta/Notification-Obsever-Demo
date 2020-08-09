//
//  ViewController2.swift
//  demo
//
//  Created by Raju Gupta on 23/02/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    @IBAction func onclickBeer(_ sender: Any)
    {
        let name = Notification.Name(rawValue: BeerKey)
        NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onClickRecipe(_ sender: Any)
    {
        let name = Notification.Name(rawValue: RecipeKey)
          NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
}
