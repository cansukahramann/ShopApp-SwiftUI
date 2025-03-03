//
//  PromotedProductsViewModel.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 3.03.2025.
//

import Foundation

final class PromotedProductsViewModel: ObservableObject {
    @Published private(set) var viewState: ViewState<[Product]> = .loading}
