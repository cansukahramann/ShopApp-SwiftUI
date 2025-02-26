//
//  EmptyCartView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 25.02.2025.
//

import SwiftUI
import Lottie

struct EmptyCartView: View {
    var body: some View {
        LottieView(animation: .named("emptyCartAnimation.json"))
            .configure({ lottieAnimation in
                lottieAnimation.contentMode = .scaleAspectFit
             })
            .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
            .animationDidFinish { completed in
                
            }
    }
}

#Preview {
    EmptyCartView()
}
   
