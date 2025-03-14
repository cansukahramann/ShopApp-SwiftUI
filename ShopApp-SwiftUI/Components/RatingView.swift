//
//  RatingView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 11.02.2025.
//

import SwiftUI

struct RatingView: View {
    let rate: Double
    let count: Int
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<5) { index in
                Image(systemName: index < Int(rate) ? "star.fill" : "star")
                    .frame(width: 12, height: 12)
                    .foregroundStyle(.yellow)
            }
            
            Text("(\(count))")
                .foregroundStyle(.gray)
                .font(.caption)
                .padding(.leading, 6)
        }
    }
}
