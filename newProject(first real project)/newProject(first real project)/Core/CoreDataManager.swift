//
//  CoreDataManager.swift
//  newProject(first real project)
//
//  Created by Andrew Sagatelov on 11.09.2023.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let contaner = AppDelegate.contaner
    let network = NetworkManager()
    
    // MARK: - create and seve useres in data base
    //create
    func getAllUsers(_ complitionHandler: @escaping (([UsersModel]) -> Void)) {
        let context = contaner.viewContext
        context.perform {
            let userEntities = try? UsersEntity.all(users: context)
            let users = userEntities?.map { UsersModel(entity: $0) }
            
            complitionHandler(users ?? [])
            
        }
    }
    
    //save
    func save(users: [UsersModel], complitionHandler: () -> Void) {
        
        let context = contaner.viewContext
        
        context.perform {
            for user in users {
                _ = try? UsersEntity.findOrCreateUser(user: user, with: context)
                
            }
        }
        
        try? context.save()
        
        complitionHandler()
    }
    
    
    // MARK: - create and seve posts in data base
    // create
    func getPostsByUserSelected(selectedUser: UsersModel, complitionHandler: @escaping ([PostsModel]) -> Void) {
        let context = contaner.viewContext
        context.perform {
            let postsEntity = try? PostEntity.getPost(byUser: selectedUser, context: context)
            let post = postsEntity?.map { PostsModel(postEntity: $0) }
            
            complitionHandler(post ?? [])
        }
    }
    
    //save
    func save(posts: [PostsModel], complitionHandler: () -> Void) {
        let context = contaner.viewContext
        
        context.perform {
            for post in posts {
                _ = try? PostEntity.findeOrCrate(posts: post, context: context)
            }
        }
    }
}
