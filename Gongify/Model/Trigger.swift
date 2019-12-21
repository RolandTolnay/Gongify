//
//  Trigger.swift
//  Gongify
//
//  Created by Roland Tolnay on 17/06/2018.
//  Copyright © 2018 Roland Tolnay. All rights reserved.
//

import Foundation
import UserNotifications
import SwiftDate

struct Trigger: Codable, Equatable {
  
  var time: Time
  var weekdays: [Weekday]
  
  var calendarNotifications: [UNCalendarNotificationTrigger] {
    
    var triggers = [UNCalendarNotificationTrigger]()
    weekdays.forEach { weekday in
      
      let components = DateComponents(hour: time.hour,
                                      minute: time.minute,
                                      weekday: weekday.rawValue)
      let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
      triggers.append(trigger)
    }

    return triggers
  }
}
