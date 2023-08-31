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
    
    func loadAllUsers(complitionHandler: @escaping ([UsersModel]) -> ()) {
        
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
}
