//
//  WeatherChangeManager.swift
//  Weatherly
//
//  Created by shivam dahale on 12/12/25.
//

import Foundation

class WeatherChangeManager {
    
    //MARK: - Detect weather change
    func detectWeatherChange(currentData: DataModel) {
        let previousTemperature = UserDefaults.standard.integer(forKey: "previousTemperature")
        let previousCondition = UserDefaults.standard.string(forKey: "previousCondition") ?? ""
        
        //compare current Data with previous
        if previousTemperature != currentData.temperature || previousCondition != currentData.condition {
            
            //notify user about change
            DispatchQueue.main.async{
                NotificationService.shared.sendWeatherChangeNotification(temperature: currentData.temperature, condition: currentData.condition)
            }
            
            print("Weather changed\(currentData.temperature) \(currentData.condition)")
        }
        
        //update the values of UserDefaults
        UserDefaults.standard.set(currentData.temperature, forKey: "previousTemperature")
        UserDefaults.standard.set(currentData.condition, forKey: "previousCondition")
    }
}
