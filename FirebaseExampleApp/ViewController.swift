//
//  ViewController.swift
//  FirebaseExampleApp
//
//  Created by Steve Westgarth on 06/09/2016.
//  Copyright © 2016 Steve Westgarth. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
   
    
    @IBOutlet weak var btnRandomButton: UIButton!
    @IBAction func btnReloadData_Click(sender: AnyObject) {
        
       
       Constants().setupAPP()
      
        outputData()
        
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
       outputData()
        
        
    }

    
    
        
    func outputData() {
        
       
     
        btnRandomButton.backgroundColor = HelperMethods().hexStringToUIColor(Constants().getButtonBackgroundColor())
        
        
        
        btnRandomButton.setTitleColor(HelperMethods().hexStringToUIColor(Constants().getButtonTextColor()), forState: UIControlState.Normal)
        
        
        
        
        
        btnRandomButton.setTitle(Constants().getButtonText(), forState: UIControlState.Normal)
        
       
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
        
    


}



