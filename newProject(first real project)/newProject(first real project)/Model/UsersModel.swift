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
    var address: UserAddressInfo
    var phone: String
    var website: String
    var company: UserCompanyInfo
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
