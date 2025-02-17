//
//  User.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 13.02.2025.
//

import Foundation

struct User {
    var city: String
    var street: String
    var id: Int
    var email: String
    var password: String
    var name: Name
        
    init(city: String, street: String, id: Int, email: String, password: String, name: Name) {
        self.city = city
        self.street = street
        self.id = id
        self.email = email
        self.password = password
        self.name = name
    }
}

struct Name {
    var firstname: String
    var lastname: String
}
