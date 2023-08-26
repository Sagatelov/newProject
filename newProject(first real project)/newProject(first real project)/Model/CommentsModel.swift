//
//  CommentsModel.swift
//  newProject(first real project)
//
//  Created by Andrew Sagatelov on 26.08.2023.
//

import Foundation

class CommentsModel: Codable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
