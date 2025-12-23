//
//  WeatherServices.swift
//  Weatherly
//
//  Created by shivam dahale on 11/12/25.
//

import Foundation
import Combine

class WeatherServices {
    
    func getWeatherDetails(model: RequestModel) -> AnyPublisher <ResponseModel, Error> {
        
        NetworkManager.shared.createRequest(baseURL: .dev, endpoint: .weather(model: model), httpMethod: .get, body: nil)
            .decode(type: ResponseModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
