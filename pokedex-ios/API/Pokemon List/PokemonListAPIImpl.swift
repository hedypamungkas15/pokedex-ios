//
//  PokemonListAPIImpl.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation
import RxSwift

class PokemonListAPIImpl: PokemonListAPI {

    private class GetPokemons: HTTPRequest {
        var method = HTTPMethod.GET
        var path = "/pokemon"
        var apiVersion = ApiVersion.v2
        var parameters = [String: Any]()
        var authentication = HTTPAuth.tokenType.basic
        var header = HeaderType.basic
        
        init(parameters: [String: Any]) {
            self.parameters = parameters
        }
    }
    
    let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func request(parameters: [String : Any]) -> Single<PokemonListResponse> {
        return httpClient.send(request: GetPokemons(parameters: parameters))
    }
}
