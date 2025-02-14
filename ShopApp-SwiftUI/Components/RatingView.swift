//
//  RatingView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 11.02.2025.
//

import SwiftUI

struct RatingView: View {
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<5) { _ in
                Image(systemName: "star.fill")
                    .frame(width: 12, height: 12)
                    .foregroundStyle(.yellow)
            }
            
            Text("(15)")
                .foregroundStyle(.gray)
                .font(.caption)
                .padding()
        }
    }
}

#Preview {
    RatingView()
}
