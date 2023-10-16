//
//  PostEntity.swift
//  newProject(first real project)
//
//  Created by Andrew Sagatelov on 08.09.2023.
//

import Foundation
import CoreData

class PostEntity: NSManagedObject {
    
    class func findeOrCrate(posts: PostsModel, context: NSManagedObjectContext) throws -> PostEntity? {
        
        let request = PostEntity.fetchRequest()
        request.predicate = NSPredicate.init(format: "id = %id", posts.id)
        
        do {
            let postEntity = try context.fetch(request)
            if postEntity.count > 0 {
                assert(postEntity.count == 1, "Duplicate has been found in DB!")
                return postEntity[0]
            } else {
                if let userEntity = try UsersEntity.find(byId: posts.userId, context: context) {
                    let createPost = PostEntity(context: context)
                    createPost.id = Int64(posts.id)
                    createPost.body = posts.body
                    createPost.title = posts.title
                    createPost.userId = Int64(posts.userId)
                    createPost.user = userEntity
                    
                    
                    return createPost
                }
            }
            
        } catch {
            throw error
        }
        
        return nil
    }
    
    class func getPost(byUser: UsersModel, context: NSManagedObjectContext) throws -> [PostEntity] {
        
        let recuest = PostEntity.fetchRequest()
        recuest.predicate = NSPredicate.init(format: "userId = %id", byUser.id)
        
        do {
            let postEntity = try context.fetch(recuest)
            return postEntity
        } catch {
            throw error
        }
    }
}
