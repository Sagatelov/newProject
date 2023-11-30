//
//  Navigator.swift
//  newProject(first real project)
//
//  Created by Andrew Sagatelov on 28.08.2023.
//

import Foundation
import UIKit

protocol NavigationInitialProtocol {
    func VewControllerInit() -> UIViewController
}

class MainNavigator {
    
    static let shered = MainNavigator()
    
    let window: UIWindow
    let tabBar: UITabBarController
    private var navigators: [NavigationInitialProtocol]
    
    init() {
        window = UIWindow()
        tabBar = UITabBarController()
        
        window.rootViewController = tabBar
        window.makeKeyAndVisible()
        navigators = [UsersNavigator()]
        let controllers = navigators.map { $0.VewControllerInit() }
        tabBar.viewControllers = controllers
    }
}


