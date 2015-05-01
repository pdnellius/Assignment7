//
//  FirstViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    var number = ""

    @IBOutlet weak var label: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var text = ""
        
        
        
        let defaults = NSUserDefaults.standardUserDefaults()
        if let teststring = defaults.stringForKey("test_string")
        {
            println(teststring)
            text = "This is the string: " + teststring + "\n"
        } else {
        println("error on teststring")
        }
        if let testnumber = defaults.stringForKey(String("test_number")) {
            println(testnumber)
        text += "This is the number: " + testnumber
            
        } else {
            println("error on testnumber")
        }
        
        label.text = text
        
    }
}