//
//  ProfileViewModel.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 14.02.2025.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var user: User? 
    
    
    func fetchUserData() {
        // n eetwork reqeust
//        self.user = user
        self.user = User(city: "İzmir", street: "Aliağa", id: 1, email: "cans@gmail.com", password: "111", name:Name(firstname: "Cansu", lastname: "Kahraman"))
    }
}
