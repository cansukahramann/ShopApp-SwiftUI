//
//  View+Ext.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 17.02.2025.
//

import SwiftUI

enum ContentInset {
    case vertical(inset: CGFloat = 8)
    case horizontal(inset: CGFloat = 8)
}

extension View {
    func contentInsetView(_ inset: ContentInset) -> some View {
        switch inset {
        case .vertical(let inset):
            Color.clear.frame(height: inset)
        case .horizontal(let inset):
            Color.clear.frame(width: inset)
        }
    }
    
    func debugBackground(_ color: Color = .red) -> some View {
        self.background(color)
    }
}
