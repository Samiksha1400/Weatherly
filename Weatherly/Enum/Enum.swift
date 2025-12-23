//
//  Enum.swift
//  Weatherly
//
//  Created by shivam dahale on 11/12/25.
//

import Foundation

enum BaseURL: String {
    case dev = "https://api.openweathermap.org/data/2.5"
    case prod = " "
}

enum EndPoint{
    case weather(model: RequestModel)
        
        var rawValue: String {
            switch self {
            case .weather(let model):
                let apiKey = "fb48d85f23d77786b5900d5b5453bb78"
                let encodedCity = model.city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? model.city
                return "/weather?q=\(encodedCity)&appid=\(apiKey)"
            }
        }
}

enum httpMethod: String {
    case get = "GET"
    case post = "POST"
}
