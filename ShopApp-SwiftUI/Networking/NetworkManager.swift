//
//  NetworkManager.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 17.02.2025.
//

import Foundation
import Moya

final class NetworkManager {
    private let provider = MoyaProvider<MultiTarget>()
    
    static let shared = NetworkManager()
    private init() {}
    
    func request(_ target: any TargetType, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void) {
        provider.request(MultiTarget(target)) { result in
            switch result {
            case .success(let response):
                completion(.success((response.data, response.response!)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
