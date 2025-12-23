//
//  RequestModel.swift
//  Weatherly
//
//  Created by shivam dahale on 11/12/25.
//

import SwiftUI

struct RequestModel: Codable {
    var city: String
    
    init(model: DataModel){
        city = model.city
    }
}
