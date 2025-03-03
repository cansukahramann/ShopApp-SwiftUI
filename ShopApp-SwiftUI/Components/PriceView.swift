//
//  PriceView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 3.03.2025.
//

import SwiftUI

struct PriceView: View {
    let price: Double
    
    var body: some View {
        Text("$\(price, specifier:"%.2f")")
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
