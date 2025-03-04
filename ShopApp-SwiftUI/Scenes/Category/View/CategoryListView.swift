//
//  CategoryListView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 10.02.2025.
//

import SwiftUI

struct CategoryListView: View {
    @StateObject private var viewModel: CategoryListViewModel
    
    init(_ viewModel: CategoryListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            switch viewModel.viewState {
            case .loading:
                LoadingIndicatorView()
                
            case .display(let categories):
                view(categories)
                
            case .displayError(let message):
                ErrorView(message: message)
            }
        }
        .onViewDidLoad {
            viewModel.loadCategories()
        }
    }
    
    func view(_ categories: [Category]) -> some View {
        ScrollView(.horizontal,showsIndicators: false) {
            LazyHStack() {
                contentInsetView(.horizontal(inset: 8))
                
                ForEach(categories, id: \.self) { category in
                    Button {
                        viewModel.selectedCategory = category
                    } label: {
                        Text(category.name)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.brown)
                            .underline(viewModel.selectedCategory == category, color: .brown)
                            .padding()
                            .overlay {
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(lineWidth: 1)
                                    .fill(Color.brown)
                                    .frame(height: 45)
                            }
                    }
                }
                contentInsetView(.horizontal(inset: 8))
            }
        }
        .frame(height: 50)
    }
}
