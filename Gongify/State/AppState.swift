//
//  AppState.swift
//  Gongify
//
//  Created by Roland Tolnay on 17/06/2018.
//  Copyright © 2018 Roland Tolnay. All rights reserved.
//

import Foundation
import ReSwift

public struct AppState: StateType, Codable {
  
  var gongs: [Gong]
  
  init() {
    gongs = [Gong]()
  }
}
