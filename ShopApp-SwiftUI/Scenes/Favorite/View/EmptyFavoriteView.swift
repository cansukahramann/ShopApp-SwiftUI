//
//  EmptyFavoriteView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 27.02.2025.
//

import SwiftUI
import Lottie

struct EmptyFavoriteView: View {
    var body: some View {
        VStack(alignment: .center) {
            LottieView(animation: .named("emptyFavoriteAnimation.json"))
                .configure({ lottieAnimation in
                    lottieAnimation.contentMode = .scaleAspectFit
                 })
                .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                .animationDidFinish { completed in
                }
                .frame(height: 250)

            Text("Your favorites list is empty. Start saving your favorite products for quick access!")
                .font(.callout)
                .fontWeight(.bold)
                .padding()
        }
    }
}

