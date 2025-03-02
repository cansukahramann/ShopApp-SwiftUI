//
//  OnboardingImageView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 3.03.2025.
//

import SwiftUI

struct OnboardingImageView: View {
    var imageName: String

    var body: some View {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
    }
}
