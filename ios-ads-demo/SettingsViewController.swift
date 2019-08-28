//
//  SettingsViewController.swift
//  ios-ads-demo
//
//  Created by Lior Kupfer on 24/08/2019.
//  Copyright © 2019 wentaoli. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let sizeKey = "size";
    let sizes = ["Small", "Medium", "Large"]
    

    @IBOutlet weak var sizeSelector: UISegmentedControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let value = UserDefaults.standard.value(forKey: sizeKey){
            let selectedIndex = value as! Int
            sizeSelector.selectedSegmentIndex = selectedIndex
        }
    }
    

    
    @IBAction func sizeSelect(_ sender: UISegmentedControl) {
    
        UserDefaults.standard.set(sender.selectedSegmentIndex, forKey: sizeKey)
        //TODO implement Gender User Property
    }
    

}
