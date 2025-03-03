//
//  PromotedProductsLoaderProtocol.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 3.03.2025.
//

import Foundation

protocol PromotedProductsLoaderProtocol {
    func load(completion: @escaping (Result<[Product], Error>) -> Void) 
}
