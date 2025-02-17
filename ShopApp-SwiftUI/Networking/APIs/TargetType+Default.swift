//
//  TargetType+Default.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 14.02.2025.
//

import Foundation
import Moya

extension TargetType {
    var baseURL: URL {
        URL(string: "https://fakestoreapi.com/")!
    }
    
    var headers: [String : String]? {
        return nil
    }
}
