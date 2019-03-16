//
//  AppDelegate.swift
//  SnapchatClone
//
//  Created by Max Miranda on 9/20/18.
//  Copyright © 2018 ___MaxAMiranda___. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate{

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        /* PART 1 START */
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: "Come back!", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "Come Back to SnapChat", arguments: nil)
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: true)
        let request = UNNotificationRequest(identifier: "FiveSecond", content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error : Error?) in
            if let theError = error {
                print("there is an error lol")
                print(theError)
            }
        }
        /* PART 1 FINISH */
    }
}

