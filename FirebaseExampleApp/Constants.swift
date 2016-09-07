//
//  Constants.swift
//  FirebaseExampleApp
//
//  Created by Steve Westgarth on 06/09/2016.
//  Copyright © 2016 Steve Westgarth. All rights reserved.
//

import UIKit
import Firebase

class Constants: NSObject {

    
     var remoteConfig:FIRRemoteConfig!
    
    
    //Define Constant Keys
    let ButtonColorConfigKey = "ButtonColor"
    let ButtonTextColorConfigKey = "ButtonTextColor"
    let ButtonTextConfigKey = "ButtonText"
    

    
    func setupAPP()
    {
        //Create Firebase defaults and make them accessible to the class
        createDefaults()
        
        //Fetch remote config values from Firebase
        remoteConfig.fetchWithExpirationDuration(0) { (status, error) -> Void in
            if (status == FIRRemoteConfigFetchStatus.Success) {
                print("Config fetched!")
                self.remoteConfig.activateFetched()
             
            } else {
                print("Config not fetched")
                print("Error \(error!.localizedDescription)")
            }
        }
    }
    
   
    
    
    func createDefaults()
    {
        
        //Instantiate the variable remoteConfig as an instance of Firebase remoteConfig
        remoteConfig = FIRRemoteConfig.remoteConfig()
        
        //Enable developer mode. This ensure that the client side throttle is never reached and will allow data to be refreshed during development. Make sure this is set to false for production.
        let remoteConfigSettings = FIRRemoteConfigSettings(developerModeEnabled: true)
        
        //Instantiate config settings of the remote config variable
        remoteConfig.configSettings = remoteConfigSettings!
        
        //Point remote config to the plist containing the default values
        remoteConfig.setDefaultsFromPlistFileName("RemoteConfigDefaults")
        
       
    }
    
    func getButtonText()-> String
    {
        //Instantiate Firebase Defaults
        createDefaults()
        
        //Return button Text Default Value
        return self.remoteConfig["ButtonText"].stringValue!
    }
    
    func getButtonBackgroundColor()-> String
    {
        createDefaults()
        return self.remoteConfig[Constants().ButtonColorConfigKey].stringValue!
    }
    
    func getButtonTextColor()-> String
    {
        createDefaults()
        return self.remoteConfig[Constants().ButtonTextColorConfigKey].stringValue!
    }

    
}
