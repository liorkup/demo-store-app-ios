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

import Foundation
import UIKit

class MockItemProvider {
    static func newArrivals() -> [Product] {
        return [
            Product(id:"1", name: "Tee Green", photo: UIImage(named: "greentee"), price: 21.99, category: "APPAREL")!,
            Product(id:"2", name: "Tee Red", photo: UIImage(named: "redtee"), price: 21.99, category: "APPAREL")!,
            Product(id:"3", name: "Tee Yellow", photo: UIImage(named: "yellowtee"), price: 21.99, category: "APPAREL")!
        ]
    }
    
    static func bestSellers() -> [Product] {
        return [
            Product(id:"4", name: "Zip Hoodie", photo: UIImage(named: "hoodie"), price: 59.99, category: "APPAREL")!,
            Product(id:"5", name: "Sweatershirt", photo: UIImage(named: "sweater"), price: 51.99, category: "APPAREL")!,
            Product(id:"6", name: "Notebook", photo: UIImage(named: "notebook"), price: 12.99, category: "OFFICE")!
        ]
    }
    
    static func recommended() -> [Product] {
        return [
            Product(id:"7", name: "Sticker Sheet", photo: UIImage(named: "sticker"), price: 2.99, category: "ACCESSORIES")!,
            Product(id:"8", name: "Pom Beanie", photo: UIImage(named: "pombeanie"), price: 19.99, category: "HEADWEAR")!,
            Product(id:"9", name: "Black Cap", photo: UIImage(named: "blackhat"), price: 17.99, category: "HEADWEAR")!
        ]
    }
    
    static func all() -> [String : Product] {
        return  (newArrivals() + bestSellers() + recommended()).reduce([String: Product]()) { (dict, product) -> [String: Product] in
            var dict = dict
            dict[product.name.lowercased().replacingOccurrences(of: " ", with: "")] = product
            return dict
        }
    }
}
