//
//  SpeciesAPIImpl.swift
//  pokedex-ios
//
//  Created by Hedy on 09/08/21.
//

import Foundation
import RxSwift

class SpeciesAPIImpl: SpeciesAPI {

    private class GetSpecies: HTTPRequest {
        var method = HTTPMethod.GET
        var path = "/pokemon-species/"
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
    
    func request(id: String) -> Single<SpeciesResponse> {
        return httpClient.send(request: GetSpecies(id: id))
    }
}
