//
//  StateType+userDefaults.swift
//  ReSwift-Template
//
//  Created by Roland Tolnay on 18/06/2018.
//  Copyright © 2018 Roland Tolnay. All rights reserved.
//

import Foundation
import ReSwift

private extension StateType {
  
  static var key: String {
    return String(describing: self)
  }
}

extension StateType where Self: Encodable {
  
  func save() {
    do {
      let encoded = try JSONEncoder().encode(self)
      UserDefaults.standard.set(encoded, forKey: Self.key)
      UserDefaults.standard.synchronize()
    } catch {
      assertionFailure(error.localizedDescription)
    }
  }
}

extension StateType where Self: Decodable {
  
  static func load() -> Self? {
    guard let archivedData = UserDefaults.standard.data(forKey: key) else {
      return nil
    }
    do {
      return try JSONDecoder().decode(self, from: archivedData)
    } catch {
      assertionFailure(error.localizedDescription)
      return nil
    }
  }
}
