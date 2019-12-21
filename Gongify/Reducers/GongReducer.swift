//
//  MainReducer.swift
//  Gongify
//
//  Created by Roland Tolnay on 17/06/2018.
//  Copyright © 2018 Roland Tolnay. All rights reserved.
//

import Foundation
import ReSwift

func gongReducer(action: Action, state: AppState?) -> AppState {
  var state = state ?? AppState()
  
  switch action {
    
  case let createGongAction as GongActionCreate:
    let gong = Gong(gongAction: createGongAction)
    if !state.gongs.contains(gong) {
      state.gongs.append(gong)
    }
    
  case let deleteGongAction as GongActionDelete:
    state.gongs = state.gongs.filter {
      $0 != deleteGongAction.gong
    }
  case let updateTimeGongAction as GongActionUpdateTime:
    if let index = state.gongs.index(of: updateTimeGongAction.gong) {
      state.gongs[index].trigger.time = updateTimeGongAction.time
    }
  case let updateDescGongAction as GongActionUpdateDescription:
    if let index = state.gongs.index(of: updateDescGongAction.gong) {
      state.gongs[index].description = updateDescGongAction.gongDescription
    }
    
  default:
    break
  }
  
  return state
}

private extension Gong {
  
  init(gongAction: GongActionCreate) {
    
    self.trigger = Trigger(time: gongAction.time,
                           weekdays: gongAction.weekdays)
    self.description = gongAction.description
  }
}
