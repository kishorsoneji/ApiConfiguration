//
//  ViewController.swift
//  SampleDemo
//
//  Created by Harry on 7/5/17.
//  Copyright © 2017 Harry. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIUtility.sharedInstace.makeGetApiCallWithEndURL(url: <#T##String#>, parameters: <#T##NSDictionary!#>) { (response, error) in
            print(response!)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

