//
//  AppDelegate.swift
//  Cinema
//
//  Created by Nurzhigit Smailov on 5/7/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func setRootViewAuth() {
        let auth = AuthViewController()
        self.window?.rootViewController = auth
        self.window?.makeKeyAndVisible()
    }
    
    
    func setRootViewTabBar() {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.barTintColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        tabBarController.tabBar.tintColor = .white
        tabBarController.tabBarItem.badgeColor = UIColor(hue: 0, saturation: 0, brightness: 0.62, alpha: 1.0)
        
        
        let profile = ProfileViewController()
        let profileNavController = UINavigationController(rootViewController: profile)
        profileNavController.tabBarItem.title = "Profile"
        profileNavController.tabBarItem.image = UIImage(named: "avatar")
        
        let collections = FilmListViewController()
        let collectionsNavController = UINavigationController(rootViewController: collections)
        collectionsNavController.tabBarItem.title = "Top Films"
        collectionsNavController.tabBarItem.image = UIImage(named: "list")
        
        let history = HistoryViewController()
        let historyNavController = UINavigationController(rootViewController: history)
        historyNavController.tabBarItem.title = "History"
        historyNavController.tabBarItem.image = UIImage(named: "history")
        
        let news = NewsViewController()
        let newsNavController = UINavigationController(rootViewController: news)
        newsNavController.tabBarItem.title = "News"
        newsNavController.tabBarItem.image = UIImage(named: "house")
        
        let random = RandomFilmViewController()
        let randomNavController = UINavigationController(rootViewController: random)
        randomNavController.tabBarItem.title = "Random"
        randomNavController.tabBarItem.image = UIImage(named: "shuffle_icon")
        
        tabBarController.viewControllers = [newsNavController, collectionsNavController,randomNavController, historyNavController, profileNavController]
        
        window?.rootViewController = tabBarController
    }
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.backgroundColor = UIColor.white
        
        setRootViewTabBar()
        
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

