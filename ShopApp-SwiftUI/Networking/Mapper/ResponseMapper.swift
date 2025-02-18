//
//  ResponseMapper.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 17.02.2025.
//

import Foundation

enum ResponseMapper {
    static func map<T: Decodable>(_ result: Result<(Data, HTTPURLResponse), any Error>) -> Result<T, Error> {
        switch result {
        case let .success((data, _)):
            let decoder = JSONDecoder()
            do {
                return .success(try decoder.decode(T.self, from: data))
            } catch {
                return .failure(error)
            }
            
        case .failure(let error):
            return .failure(error)
        }
    }
}
