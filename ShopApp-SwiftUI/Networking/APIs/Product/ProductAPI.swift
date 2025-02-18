//
//  ProductAPI.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 14.02.2025.
//

import Foundation
import Moya

enum ProductAPI: TargetType {

    case allProducts
    case singleProduct(id: Int)
    
    var path: String {
        switch self {
        case .allProducts:
            return "products"
        case .singleProduct(let id):
            return  "products/\(id)"
        }
    }
    
    var method: Moya.Method { .get }
    
    var task: Moya.Task { .requestPlain }
}
