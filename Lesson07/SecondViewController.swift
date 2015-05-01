//
//  SecondViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textLabel: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        var name = NSUserDefaults.standardUserDefaults().stringForKey("settings_name")!
        
        var slider = NSUserDefaults.standardUserDefaults().stringForKey("settings_slider")!
        
        
        textLabel.text = "The value of the slider is: \(slider)\nThe value of the label is: \(name)"
        

        // Do any additional setup after loading the view.
    }
}
