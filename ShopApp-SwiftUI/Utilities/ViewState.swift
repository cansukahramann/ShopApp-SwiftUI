//
//  ViewState.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 3.03.2025.
//

import Foundation

enum ViewState<T> {
    case loading
    case display(T)
    case displayError(String)
}
