//
//  FakePromotedProductsLoader.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 3.03.2025.
//

import Foundation

struct FakePromotedProductsLoader: PromotedProductsLoaderProtocol {
    private let result: Result<[Product], any Error>
    init(result: Result<[Product], any Error>) {
        self.result = result
    }
    
    func load(completion: @escaping (Result<[Product], any Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(result)
        }
    }
}

