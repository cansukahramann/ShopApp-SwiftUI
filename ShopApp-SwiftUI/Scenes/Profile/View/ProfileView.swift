//
//  ProfileView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 13.02.2025.
//

import SwiftUI


struct ProfileView: View {
    @ObservedObject var viewModel = ProfileViewModel()
    @State var selectedProduct: Product?
    
    var body: some View {
        
        VStack {
            SearchBar(search: .constant(""))
                .padding()
            
            Spacer()
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 4) {
                    if let user = viewModel.user {
                        Text("\(user.name.firstname) \(user.name.lastname)")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        
                        Text("\(user.email)")
                            .font(.headline)
                            .foregroundStyle(.gray)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                Spacer()
                FavoriteProductsView(product: viewModel.products, selectedProduct: $selectedProduct)
            }.onAppear {
                viewModel.fetchUserData()
            }
        }
    }
}

#Preview {
    ProfileView()
}
