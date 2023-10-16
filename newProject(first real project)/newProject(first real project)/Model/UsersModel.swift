//
//  UsersModel.swift
//  newProject(first real project)
//
//  Created by Andrew Sagatelov on 26.08.2023.
//

import Foundation

class UsersModel: Codable {
    var id: Int
    var name: String
    var username: String
    var email: String
    var address: UserAddressInfo?
    var phone: String?
    var website: String?
    var company: UserCompanyInfo?
    
    init (entity: UsersEntity) {
        self.id = Int(entity.id)
        self.name = entity.name ?? ""
        self.username = entity.username ?? ""
        self.email = entity.email ?? ""
        self.address = nil
        self.phone = nil
        self.website = nil
        self.company = nil
        
        
    }
}

class UserAddressInfo: Codable {
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var geo: UserGeoInfo
}

class UserGeoInfo: Codable {
    var lat: String
    var lng: String
}

class UserCompanyInfo: Codable {
    var name: String
    var catchPhrase: String
    var bs: String
}
