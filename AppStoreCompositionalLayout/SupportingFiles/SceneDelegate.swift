//
//  SceneDelegate.swift
//  AppStoreCompositionalLayout
//
//  Created by Tieda Wei on 2020-01-04.
//  Copyright © 2020 Tieda Wei. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow()
        window?.windowScene = scene
        window?.rootViewController = MainTabBarController()
        window?.makeKeyAndVisible()
    }

}

