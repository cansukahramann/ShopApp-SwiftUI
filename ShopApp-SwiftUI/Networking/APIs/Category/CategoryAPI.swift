//
//  CategoryAPI.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 17.02.2025.
//

import Foundation
import Moya

enum CategoryAPI {
    case allCategories
    case specificCategory(categoryName: String)
}

extension CategoryAPI: TargetType {
    var path: String {
        switch self {
        case .allCategories:
            return "products/categories"
        case .specificCategory(let categoryName):
            return  "products/category/\(categoryName)"
        }
    }
    
    var method: Moya.Method { .get }
    
    var task: Moya.Task { .requestPlain }
}
