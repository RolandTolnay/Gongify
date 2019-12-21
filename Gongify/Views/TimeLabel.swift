//
//  TimeLabel.swift
//  Gongify
//
//  Created by Roland Tolnay on 20/06/2018.
//  Copyright © 2018 Roland Tolnay. All rights reserved.
//

import UIKit

class TimeLabel: UILabel {
  
  var time: Time = Time(hour: 12, minute: 30) {
    didSet {
      text = time.description
    }
  }
}
