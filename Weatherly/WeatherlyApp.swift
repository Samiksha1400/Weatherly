//
//  WeatherlyApp.swift
//  Weatherly
//
//  Created by shivam dahale on 11/12/25.
//

import SwiftUI

@main
struct WeatherlyApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self)
        var appDelegate
    
    init(){
        NotificationService.shared.requestPermission()
    }
    var body: some Scene {
        WindowGroup {
            WeatherView()
        }
    }
}
