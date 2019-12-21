//
//  GongAction.swift
//  Gongify
//
//  Created by Roland Tolnay on 17/06/2018.
//  Copyright © 2018 Roland Tolnay. All rights reserved.
//

import Foundation
import ReSwift

struct GongActionCreate: Action {
  
  let description: String
  let time: Time
  let weekdays: [Weekday]
}

struct GongActionDelete: Action {
  
  let gong: Gong
}

struct GongActionUpdateTime: Action {
  
  let time: Time
  let gong: Gong
}

struct GongActionUpdateDescription: Action {
  
  let gongDescription: String
  let gong: Gong
}
