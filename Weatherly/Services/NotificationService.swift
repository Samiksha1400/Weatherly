//
//  NotificationService.swift
//  Weatherly
//
//  Created by shivam dahale on 12/12/25.
//

import Foundation
import UserNotifications

class NotificationService {
    static let shared = NotificationService()
    
    //MARK: - Request Permission
    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]){ granted, error in
            
            if granted{
                print("Permission Granted")
            }else {
                print("Permission Denied")
            }
        }
    }
    
    //MARK: - Send Weather Change Notification
    func sendWeatherChangeNotification(temperature: Int, condition: String) {
        let content = UNMutableNotificationContent()
        content.title = "Weather Update"
        content.body = "The weather is changing!"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        
        let request = UNNotificationRequest(identifier: "weatherChange", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}
