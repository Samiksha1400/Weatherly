//
//  WeatherVM.swift
//  Weatherly
//
//  Created by shivam dahale on 11/12/25.
//

import Foundation
import Combine

class WeatherVM: ObservableObject{
    
    @Published var weatherData = DataModel()
    let weatherServices = WeatherServices()
    let weatherchangeManager = WeatherChangeManager()
    var cancellables = Set<AnyCancellable>()
    
    //MARK: - Fetch Weather Details
    func fetchWeatherDetails(){
        let requestModel = RequestModel(model: weatherData)
        weatherServices.getWeatherDetails(model: requestModel)
            .sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    print(error.localizedDescription)
                }
            },
                  receiveValue: { [weak self] response in
                    let newData = DataModel(model: response)
                    self?.weatherData = newData
                    
                    self?.weatherchangeManager.detectWeatherChange(currentData: newData)
                    
                })
            .store(in: &cancellables)
    }
}
