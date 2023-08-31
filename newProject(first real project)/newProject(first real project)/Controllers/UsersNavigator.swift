//
//  UsersNavigator.swift
//  newProject(first real project)
//
//  Created by Andrew Sagatelov on 28.08.2023.
//

import Foundation
import UIKit

class UsersNavigator {
    
    private var navigationController: UINavigationController
    
    enum Destination {
        case postsPage
        case commentsPage
    }
    
    func showNext(page: Destination) {
        var nextPage: Navigator
        
        switch page {
        case .postsPage: nextPage =  AllPostsOfUserController.ControllerFromStorybord()
        case .commentsPage: nextPage = AllCommentsOfPostsController.ControllerFromStorybord()
        }
        
        if let nextControler = nextPage as? UIViewController {
            navigationController.pushViewController(nextControler, animated: true)
        }
        
        nextPage.navigator = self
    }
    
    init() {
        
        let usersPage = AllUsersController.ControllerFromStorybord()
        navigationController = UINavigationController(rootViewController: usersPage)
        
        usersPage.navigator = self
    }
}

extension UsersNavigator: NavigationInitialProtocol {
    func VewControllerInit() -> UIViewController {
    return navigationController
    }
}

protocol Navigator {
    var navigator: UsersNavigator? { get set }
}
