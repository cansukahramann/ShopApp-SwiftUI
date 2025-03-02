//
//  ViewDidLoadModifier.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 3.03.2025.
//

import SwiftUI

struct ViewDidLoadModifier: ViewModifier {
    @State private var isFirstOnAppear = true
    private let action: () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    func body(content: Content) -> some View {
        content.onAppear {
            guard isFirstOnAppear else { return }
            action()
            isFirstOnAppear.toggle()
        }
    }
}
