//
//  UserEntity.swift
//  VIPER_Starter
//
//  Created by Davit on 04.04.24.
//

/// https://jsonplaceholder.typicode.com/users

import Foundation

struct User: Hashable {
    let id: Int
    let name: String
    let username: String
//    let email: String
//    let address: Address
//    let phone: String
//    let website: String
//    let company: Company
}

struct Address {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}

struct Geo {
    let lat: String
    let lng: String
}

struct Company {
    let name: String
    let catchPhrase: String
    let bs: String
}
