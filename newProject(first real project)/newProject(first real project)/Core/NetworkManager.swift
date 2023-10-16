//
//  NetworkManager.swift
//  newProject(first real project)
//
//  Created by Andrew Sagatelov on 27.08.2023.
//

import Foundation

class NetworkManager {
    
    enum Recuest {
        case GET
        case PUT
        case POST
        case DELETE
    }
    
    enum APIs: String {
        case posts
        case comments
        case users
    }
    
    let url = "https://jsonplaceholder.typicode.com/"
    
    func loadAllUsers(_ complitionHandler: @escaping ([UsersModel]) -> Void) {
        
        guard let url = URL(string: url + APIs.users.rawValue ) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("DataTask error " + "\(error.localizedDescription)" + "/n")
            } else if let responce = response as? HTTPURLResponse,
                      responce.statusCode == 200,
                      let data = data {
                let user = try? JSONDecoder().decode([UsersModel].self, from: data)
                complitionHandler(user ?? [])
            }
        }.resume()
    }
    
    
    func loadAllPosts(_ complitionHandler: @escaping ([PostsModel]) -> Void) {
        
        guard let url = URL(string: url + APIs.posts.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("DataTask error " + "\(error.localizedDescription)" + "/n")
            } else if let response = response as? HTTPURLResponse,
                      response.statusCode == 200,
                      let data = data {
                let post = try? JSONDecoder().decode([PostsModel].self, from: data)
                complitionHandler(post ?? [])
            }
        }.resume()
    }
    
    func loadAllComments(_ complitionHandler: @escaping ([CommentsModel]) -> Void) {
        guard let url = URL(string: url + APIs.comments.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("DataTask error " + "\(error.localizedDescription)" + "/n")
            } else if let response = response as? HTTPURLResponse,
                      response.statusCode == 200,
                      let data = data {
                let comments = try? JSONDecoder().decode([CommentsModel].self, from: data)
                complitionHandler(comments ?? [])
            }
        }.resume()
    }
}
