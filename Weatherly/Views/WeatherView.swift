//
//  WeatherView.swift
//  Weatherly
//
//  Created by shivam dahale on 11/12/25.
//

import SwiftUI

struct WeatherView: View {
    
    @StateObject var vm = WeatherVM()
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView{
            VStack (spacing: 15){
                
                //Search Bar
                HStack{
                    TextField("Enter City Name", text: $vm.weatherData.city)
                        .padding()
                        .background(.gray.opacity(0.3))
                        .cornerRadius(20)
                    
                    Button {
                        vm.fetchWeatherDetails()
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.blue)
                    }
                    
                }
                Spacer()
                
                //City Name
                Text("City: \(vm.weatherData.city)")
                
                //Temperature
                Text("Temperature: \(vm.weatherData.temperature)°C")
                
                Image(systemName: "sun.max.fill")
                    .foregroundColor(.yellow)
                    .scaleEffect(animate ? 1.3 : 1)
                    .animation(
                        .bouncy(duration: 1)
                        .delay(0.5)
                        .repeatForever(autoreverses: true),
                        value: animate)
                    .onAppear{
                        animate = true
                    }
                
                //Condition
                Text("Condition: \(vm.weatherData.condition)")
                
                
                HStack {
                    Text("Feels Like: \(vm.weatherData.feels_like)°C")
                    
                    Text("Humidity: \(vm.weatherData.humidity)%")
                    
                    Text("Wind: \(vm.weatherData.wind_speed) km/h")
                }
                
                //TODO: - Forecast
                Text("Forecast")
                    .font(.headline)
                
                VStack(spacing: 10){
                    ForEach(vm.weatherData.forecast, id: \.day){ forecast in
                        HStack{
                            Text(forecast.day)
                                .font(.caption)
                            
                            
                            Text("\(forecast.max)°C/\(forecast.min)°C")
                            
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .padding()
        }
        .onAppear{
            NotificationService.shared.requestPermission()
        }
        .refreshable {
            vm.fetchWeatherDetails()
        }
    }
}

#Preview {
    WeatherView()
}

