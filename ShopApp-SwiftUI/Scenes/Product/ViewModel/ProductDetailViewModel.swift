//
//  ProductDetailViewModel.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 19.02.2025.
//

import Foundation

final class ProductDetailViewModel: ObservableObject {
    @Published var isShowDetail: Bool = false
    
    func showDetail() {
        isShowDetail.toggle()
    }
}
