//
//  MainTabBarController.swift
//  AppStoreCompositionalLayout
//
//  Created by Tieda Wei on 2020-01-05.
//  Copyright © 2020 Tieda Wei. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            generateNavigationController(for: GamesController(), title: "Games", image: UIImage(named: "games")!),
            generateNavigationController(for: TodayController(), title: "Today", image: UIImage(named: "today")!),
            generateNavigationController(for: TodayController(), title: "Apps", image: UIImage(named: "apps")!),
            generateNavigationController(for: TodayController(), title: "Arcade", image: UIImage(named: "arcade")!),
            generateNavigationController(for: TodayController(), title: "Search", image: UIImage(named: "search")!),
        ]
        
    }
    
    fileprivate func generateNavigationController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        //        navController.navigationBar.barTintColor = .green
        navController.navigationBar.isTranslucent = true
        rootViewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }
}

