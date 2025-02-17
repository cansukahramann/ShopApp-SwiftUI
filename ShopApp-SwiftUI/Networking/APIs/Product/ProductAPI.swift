//
//  ProductAPI.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 14.02.2025.
//

import Foundation
import Moya

enum ProductAPI: TargetType {
    case allCategories
    case singleProduct(id: Int)
    case specificCategory(categoryName: String)
    
    
    var path: String {
        switch self {
        case .allCategories:
            return "products/categories"
        case .singleProduct(let id):
            return  "products/\(id)"
        case .specificCategory(let categoryName):
           return  "products/category/\(categoryName)"
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Moya.Task {
        .requestPlain
    }
}
