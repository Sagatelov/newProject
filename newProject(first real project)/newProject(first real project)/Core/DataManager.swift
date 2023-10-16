//
//  DataManager.swift
//  newProject(first real project)
//
//  Created by Andrew Sagatelov on 11.09.2023.
//

import Foundation
import CoreData

class DataManager {
    let netwokManager = NetworkManager()
    let context = AppDelegate.contaner.viewContext
    let coreDataManager = CoreDataManager()
    
    func getAllUsers(context: NSManagedObjectContext, complitionHandler: @escaping ([UsersModel]) -> Void) {
        coreDataManager.getAllUsers { usersBase in
            if usersBase.count > 0 {
                complitionHandler(usersBase)
            } else {
                self.netwokManager.loadAllUsers { usersNetwork in
                    
                    self.coreDataManager.save(users: usersNetwork) {
                        complitionHandler(usersNetwork)
                    }
                }
            }
        }
    }
    
    
    func getPostsByUser(selectedUser: UsersModel, context: NSManagedObjectContext, complitionHandler: @escaping (PostsModel) -> Void) {
        
    }
}
