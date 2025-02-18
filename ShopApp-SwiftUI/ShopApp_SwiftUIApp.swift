//
//  ShopApp_SwiftUIApp.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 10.02.2025.
//

import SwiftUI

@main
struct ShopApp_SwiftUIApp: App {
    let homeViewModel: HomeViewModel = {
           let service = CategoryService()
           let viewModel = HomeViewModel(categoryService: service)
           return viewModel
       }()
    
    var body: some Scene {
        WindowGroup { NavigationStack {
            HomeView(viewModel: homeViewModel)
            }
        }
    }
}
