//
//  PostsModel.swift
//  newProject(first real project)
//
//  Created by Andrew Sagatelov on 26.08.2023.
//

import Foundation

class PostsModel: Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
    
    init(postEntity: PostEntity) {
        self.userId = Int(postEntity.userId)
        self.id = Int(postEntity.id)
        self.title = postEntity.title ?? ""
        self.body = postEntity.body ?? ""
    }
}
