//
//  ProductService.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 18.02.2025.
//

import Foundation

struct ProductService {
    func fetchProducts(completion: @escaping(Result<[ProductResponseModel], Error>) -> Void) {
        NetworkManager.shared.request(ProductAPI.allProducts) {
            completion(ResponseMapper.map($0))
        }
    }
    
    func fetchDetailProduct(id: Int, completion: @escaping(Result<ProductResponseModel, Error>) -> Void) {
        NetworkManager.shared.request(ProductAPI.singleProduct(id: id)) {
            completion(ResponseMapper.map($0))
        }
    }
}
