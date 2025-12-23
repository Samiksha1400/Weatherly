//
//  DataModel.swift
//  Weatherly
//
//  Created by shivam dahale on 11/12/25.
//

import SwiftUI

struct DataModel: Codable {
    var city: String = ""
    var country: String = ""
    var temperature: Int = 0
    var condition: String = ""
    var feels_like: Int = 0
    var humidity: Int = 0
    var wind_speed: Int = 0
    var forecast: [Forecast] = []
    
    init(model: ResponseModel){
        city = model.name ?? ""
        country = model.sys?.country ?? ""
        temperature = Int(model.main?.temp ?? 0)
        condition = model.weather?.first?.main ?? ""
        feels_like = Int(model.main?.feels_like ?? 0)
        humidity = model.main?.humidity ?? 0
        wind_speed = Int(model.wind?.speed ?? 0)
        
    }
    
    init(){}
}

struct Forecast: Codable {
    var day: String = ""
    var condition: String = ""
    var max: Int = 0
    var min: Int = 0
    var icon: String = ""
}


