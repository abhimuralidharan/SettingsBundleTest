//
//  ViewController.swift
//  SettingsTest
//
//  Created by Abhilash on 29/03/17.
//  Copyright © 2017 Abhilash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        registerSettingsBundle()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.defaultsChanged), name: UserDefaults.didChangeNotification, object: nil)
    }
    func registerSettingsBundle(){
        let appDefaults = [String:AnyObject]()
        UserDefaults.standard.register(defaults: appDefaults)
    }
    func defaultsChanged(){
        SettingsBundleHelper.checkAndExecuteSettings()
    }

    deinit { //Not needed for iOS9 and above. ARC deals with the observer in higher versions.
        NotificationCenter.default.removeObserver(self)
    }
}


