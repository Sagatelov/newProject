//
//  UserEntity.swift
//  newProject(first real project)
//
//  Created by Andrew Sagatelov on 07.09.2023.
//

import Foundation
import CoreData

class UsersEntity: NSManagedObject {
    
    class func findOrCreateUser(user: UsersModel, with context: NSManagedObjectContext) throws -> UsersEntity {
        
       
        do {
            if let findUsers = try find(byId: user.id, context: context) {
                return findUsers
            } else {
                let userEntity = UsersEntity(context: context)
                userEntity.id = Int64(user.id)
                userEntity.email = user.email
                userEntity.name = user.name
                userEntity.username = user.username
                
                return userEntity
            }
            
        } catch {
            throw error
        }
        
    }
    
    class func all(users context: NSManagedObjectContext) throws -> [UsersEntity] {
        let recuest = UsersEntity.fetchRequest()
        
        do {
            let allUsers = try context.fetch(recuest)
            return allUsers
        } catch {
            throw error
        }
    }
    
    class func find(byId: Int, context: NSManagedObjectContext) throws -> UsersEntity? {
        
        let recuest: NSFetchRequest<UsersEntity> = UsersEntity.fetchRequest()
        recuest.predicate = NSPredicate(format: "id == %d", byId)
        
        do {
            let matches = try context.fetch(recuest)
            if matches.count > 0 {
                assert(matches.count == 1, "Duplicate has been found in DB!")
                return matches[0]
            }
        } catch {
            throw error
        }
        return nil
    }
}

