//
//  Time.swift
//  Gongify
//
//  Created by Roland Tolnay on 20/06/2018.
//  Copyright © 2018 Roland Tolnay. All rights reserved.
//

import Foundation

struct Time: Codable, Equatable {
  
  var hour: Int
  var minute: Int
}

extension Time: CustomStringConvertible {
  
  public var description: String {
    return "\(hour.timeString):\(minute.timeString)"
  }
}

private extension Int {
  
  var timeString: String {
    if self < 10 {
      return "0" + String(self)
    }
    return String(self)
  }
}

extension String {
  
  var time: Time? {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    guard let date = formatter.date(from: self) else {
      return nil
    }
    return Time(hour: date.hour, minute: date.minute)
  }
}
