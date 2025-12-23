//
//  ResponseModel.swift
//  Weatherly
//
//  Created by shivam dahale on 11/12/25.
//

import Foundation

struct ResponseModel: Codable {
    
    var name: String?
    var sys: Sys?
    var main: Main?
    var weather: [Weather]?
    var wind: Wind?
}

struct Sys: Codable {
    var country: String?
}

struct Main: Codable {
    var temp: Double?
    var feels_like: Double?
    var humidity: Int?
}
    
struct Weather: Codable {
    var main: String?
    var description: String?
    var icon: String?
}

struct Wind: Codable {
    var speed: Double?
}
