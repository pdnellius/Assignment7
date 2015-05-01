//
//  ThirdViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextView!

    
    @IBAction func nextButton(sender: AnyObject) {
    }
    
    var text = textField.text
    
    // MARK: Variables
     var textLabelKey = "TextLabel"
     var textLabelValue = ""
    func saveData() {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let documentsDirectory = paths.objectAtIndex(0) as! NSString
        let path = documentsDirectory.stringByAppendingPathComponent("MySimpleText.plist")
        var dict: NSMutableDictionary = ["XInitializerItem": "DoNotEverChangeMe"]
        //saving values
        dict.setObject(textLabelValue, forKey: textLabelKey)
        //...
        //writing to MySimpleText.plist
        dict.writeToFile(path, atomically: false)
        let resultDictionary = NSMutableDictionary(contentsOfFile: path)
        println("Saved MySimpleText.plist file is --> \(resultDictionary?.description)")
    }
    
    
    func loadData() {
        // getting path to MySimpleText.plist
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let documentsDirectory = paths[0] as! String
        let path = documentsDirectory.stringByAppendingPathComponent("MySimpleText.plist")
        let fileManager = NSFileManager.defaultManager()
        //check if file exists
        if(!fileManager.fileExistsAtPath(path)) {
            // If it doesn't, copy it from the default file in the Bundle
            if let bundlePath = NSBundle.mainBundle().pathForResource("MySimpleText", ofType: "plist") {
                let resultDictionary = NSMutableDictionary(contentsOfFile: bundlePath)
                println("Bundle MySimpleText file is --> \(resultDictionary?.description)")
                fileManager.copyItemAtPath(bundlePath, toPath: path, error: nil)
                println("copy")
            } else {
                println("MySimpleText not found. Please, make sure it is part of the bundle.")
            }
        } else {
            println("MySimpleText already exits at path.")
            // use this to delete file from documents directory
            //fileManager.removeItemAtPath(path, error: nil)
        }
        let resultDictionary = NSMutableDictionary(contentsOfFile: path)
        println("Loaded MySimpleText file is --> \(resultDictionary?.description)")
        var myDict = NSDictionary(contentsOfFile: path)
        if let dict = myDict {
            //loading values
            textLabelValue = dict.objectForKey(textLabelKey)! as! String
            //...
        } else {
            println("WARNING: Couldn't create dictionary from MySimpleText! Default values will be used!")
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()

        // Do any additional setup after loading the view.
    }
}
