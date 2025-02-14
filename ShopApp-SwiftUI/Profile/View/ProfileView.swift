//
//  ProfileView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 13.02.2025.
//

import SwiftUI


struct ProfileView: View {
    @ObservedObject var viewModel = ProfileViewModel()
    
    var body: some View {
        
        VStack {
            SearchBar()
                .padding()
            
            Spacer()
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 4) {
                    if let user = viewModel.user {
                        Text("\(user.name.firstname) \(user.name.lastname)")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.customNavyBlue)
                        
                        Text("\(user.email)")
                            .font(.headline)
                            .foregroundStyle(.gray)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                Spacer()
                FavoriteProductsView(product: [
                    Product(
                        title: "iPhone 15",
                        price: 999.99,
                        image: "https://example.com/iphone15.jpg",
                        category: "Electronics",
                        description: "Apple'ın en yeni akıllı telefonu.",
                        rating: Rating(rate: 4.8, count: 1200)
                    ),
                    Product(
                        title: "MacBook Air",
                        price: 1299.99,
                        image: "https://example.com/macbook.jpg",
                        category: "Computers",
                        description: "M2 çipli yeni MacBook Air.",
                        rating: Rating(rate: 4.9, count: 800)
                    )
                ], selectedProduct: .constant(nil))
            }.onAppear {
                viewModel.fetchUserData()
            }
        }
    }
}

#Preview {
    ProfileView()
}
