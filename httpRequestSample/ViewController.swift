//
//  ViewController.swift
//  httpRequestSample
//
//  Created by Horacio Garza on 08/05/16.
//  Copyright © 2016 Horacio Garza. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self;
      
        

    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {   //delegate method
        
        
        self.performSegueWithIdentifier("jsonSegue", sender: self)
        
        //prepareForSegue(, sender: <#T##AnyObject?#>)
        print("presed")
        return true
    }
    
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "jsonSegue"){
            let isbn:String? = textField.text;
            let destination = segue.destinationViewController as! JSONViewController
            destination.completeLink = isbn!;
        }
        
    }

}

