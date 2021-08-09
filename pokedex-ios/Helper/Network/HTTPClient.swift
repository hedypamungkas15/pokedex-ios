//
//  HTTPClient.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation
import RxSwift

protocol ClientAPI {
    var httpClient: HTTPClient { get }
}

protocol HTTPClient {
    func send<T: Codable>(request apiRequest: HTTPRequest) -> Single<T>
}

protocol HTTPIdentifier {
    var baseUrl: URL { get }
}

class BaseIdentifier: HTTPIdentifier {
    var baseUrl = URL(string: "https://pokeapi.co/api/")!
}
