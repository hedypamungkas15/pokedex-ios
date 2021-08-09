//
//  EvolutionAPIImpl.swift
//  pokedex-ios
//
//  Created by Hedy on 07/08/21.
//

import Foundation
import RxSwift

class EvolutionAPIImpl: EvolutionAPI {

    private class GetEvolution: HTTPRequest {
        var method = HTTPMethod.GET
        var path = "/evolution-chain/"
        var apiVersion = ApiVersion.v2
        var parameters = [String: Any]()
        var authentication = HTTPAuth.tokenType.basic
        var header = HeaderType.basic
        
        init(id: String) {
            self.path = "\(path)\(id)"
        }
    }
    
    let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func request(id: String) -> Single<EvolutionResponse> {
        return httpClient.send(request: GetEvolution(id: id))
    }
}
