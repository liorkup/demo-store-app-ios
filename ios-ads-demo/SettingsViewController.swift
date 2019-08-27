//
//  SettingsViewController.swift
//  ios-ads-demo
//
//  Created by Lior Kupfer on 24/08/2019.
//  Copyright © 2019 wentaoli. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var gender: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let value = UserDefaults.standard.value(forKey: "gender"){
            let selectedIndex = value as! Int
            gender.selectedSegmentIndex = selectedIndex
        }
    }
    
    @IBAction func genderSelect(_ sender: UISegmentedControl, forEvent event: UIEvent) {
        UserDefaults.standard.set(sender.selectedSegmentIndex, forKey: "gender")
        //TODO implement Gender User Property
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    enum Gender {
        case male, female
    }

}
