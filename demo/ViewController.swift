//
//  ViewController.swift
//  demo
//
//  Created by Raju Gupta on 31/12/19.
//  Copyright © 2019 Raju Gupta. All rights reserved.
//

import UIKit

let BeerKey = "BeerKey"
let RecipeKey = "RecipeKey"

class ViewController: UIViewController {

    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    let beer = Notification.Name(rawValue: BeerKey)
    let recipe = Notification.Name(rawValue: RecipeKey)
    
    deinit
    {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getNotificationObserver()
    }

    @IBAction func onClick(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(identifier: "ViewController2") as! ViewController2
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    func getNotificationObserver()
    {
        //Beer
        NotificationCenter.default.addObserver(self, selector: #selector(updateImg(notification:)), name: beer, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateTitile(notification:)), name: beer, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateBackground(notification:)), name: beer, object: nil)
        
        //Recipe
        NotificationCenter.default.addObserver(self, selector: #selector(updateImg(notification:)), name: recipe, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateTitile(notification:)), name: recipe, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateBackground(notification:)), name: recipe, object: nil)
    }
    
    @objc func updateImg(notification : NSNotification)
    {
        let beerNotification = notification.name == beer
        let img = beerNotification ? UIImage(named: "beer") : UIImage(named: "recipe")
        imgLogo.image = img
    }
    
    @objc func updateTitile(notification : NSNotification)
    {
        let beerNotification = notification.name == beer
        let text = beerNotification ? "BeerNotification" : "RecipeNotification"
        lblTitle.text = text
    }
    
    @objc func updateBackground(notification : NSNotification)
    {
        let beerNotification = notification.name == beer
        let color = beerNotification ? UIColor.red : UIColor.green
        self.view.backgroundColor = color
    }
    
}

