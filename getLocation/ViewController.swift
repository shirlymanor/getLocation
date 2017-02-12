//
//  ViewController.swift
//  getLocation
//
//  Created by Shirly Manor on 2/12/17.
//  Copyright © 2017 manor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let loc = GetLocation()

    override func viewDidLoad() {
        super.viewDidLoad()
        loc.getAdress { result in
            
            if let city = result["City"] as? String {
                print(city)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

