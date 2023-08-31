//
//  AllPostCommentsController.swift
//  newProject(first real project)
//
//  Created by Andrew Sagatelov on 29.08.2023.
//

import UIKit

class AllCommentsOfPostsController: UIViewController, StorybordedProtocol, Navigator {

    weak var navigator: UsersNavigator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("load")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("apprar")
    }

}
