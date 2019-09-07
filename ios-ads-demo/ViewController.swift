/*
 * Copyright 2019 wentaoli
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

//  Created by wentaoli on 5/25/19.

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier != "Settings") {
            
            guard let productDetailVC = segue.destination as? ProductTableViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            switch(segue.identifier ?? "") {
                
            case "ShowBestSeller":
                productDetailVC.section = "Best Sellers"
                
            case "ShowNewArrivals":
                productDetailVC.section = "New Arrivals"
            
            case "ShowRecommended":
                productDetailVC.section = "Just For You"
                
            default:
                fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
            }
        
        }
    }
    

}

