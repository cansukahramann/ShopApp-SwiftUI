//
//  ApplePaymentButton.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 25.02.2025.
//

import SwiftUI
import PassKit

struct ApplePaymentButton: View {
    var action: () -> Void
    var body: some View {
        Representable(action: action)
            .frame(minWidth: 100, maxWidth: 200)
            .frame(height: 40)
            .frame(maxWidth: .infinity)
    }
}

extension ApplePaymentButton {
    struct Representable: UIViewRepresentable {
        var action: () -> Void
        
        func makeCoordinator() -> Coordinator {
            Coordinator(action: action)
        }
        
        func makeUIView(context: Context) -> some UIView {
            context.coordinator.button
        }
        
        func updateUIView(_ uiView: UIViewType, context: Context) {
            context.coordinator.action = action
        }
    }
    
    class Coordinator: NSObject {
        var action: () -> Void
        var button = PKPaymentButton(paymentButtonType: .buy, paymentButtonStyle: .automatic)
        
        init(action: @escaping () -> Void) {
            self.action = action
            super.init()
            
            button.addTarget(self, action: #selector(callBack(_:)), for: .touchUpInside)
        }
        
        @objc
        func callBack(_ sender: Any?) {
            action()
        }
    }
}

#Preview {
    ApplePaymentButton(action: { })
}
