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
        case postsPage(UsersModel)
        case commentsPage(PostsModel)
    }
    
    func showNext(page: Destination) {
        var nextPage: Navigator
        
        switch page {
            
            //crate controller for page of posts
            //where "ofUser" is injection that pass information about selected user
        case .postsPage(let ofUser): nextPage = AllPostsOfUserController.ControllerFromStorybord(withItem: ofUser, complition: { coder in
            guard let controller = AllPostsOfUserController(selectedUser: ofUser, coder: coder) else { fatalError("Failed to create postPage") }
            return controller })
            
            //crate controller for page of comment
            //where "ofPost" is injection that pass information about selected posts
        case .commentsPage(let ofPost): nextPage = AllCommentsOfPostsController.ControllerFromStorybord(withItem: ofPost, complition: { coder in
            guard let controller = AllCommentsOfPostsController(selectedPost: ofPost, coder: coder) else { fatalError("Failed to create postPage") }
            return controller })
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
