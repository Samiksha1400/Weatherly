//
//  NetworkManager.swift
//  Weatherly
//
//  Created by shivam dahale on 11/12/25.
//

import Foundation
import Combine
class NetworkManager {
 
     static let shared = NetworkManager()
    
   //MARK: - create Request
    func createRequest(baseURL: BaseURL, endpoint: EndPoint, httpMethod: httpMethod, body: Data?) -> AnyPublisher<Data, Error> {
        guard let url = URL(string: "\(baseURL.rawValue)\(endpoint.rawValue)") else { return Fail(error: URLError(.badURL)).eraseToAnyPublisher() }
    
        // create url request
        var urlRequest = URLRequest(url: url)
        
        // http method assign
        urlRequest.httpMethod = httpMethod.rawValue
        
        //urlSession - send url request and get a response
        return URLSession.shared.dataTaskPublisher(for: urlRequest).map({ $0.data }).mapError({ $0 }).receive(on: DispatchQueue.main).eraseToAnyPublisher()

    }
}
