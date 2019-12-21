//
//  Store.swift
//  Gongify
//
//  Created by Roland Tolnay on 17/06/2018.
//  Copyright © 2018 Roland Tolnay. All rights reserved.
//

import Foundation
import ReSwift

let store: Store = Store<AppState>(
  reducer: gongReducer,
  state: AppState.load(),
  middleware: [loggingMiddleware]
)

let loggingMiddleware: Middleware<AppState> = { dispatch, getState in
  return { next in
    return { action in
      
      print(action)
      return next(action)
    }
  }
}
