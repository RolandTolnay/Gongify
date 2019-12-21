//
//  UIView+frame.swift
//  Gongify
//
//  Created by Roland Tolnay on 21/06/2018.
//  Copyright © 2018 Roland Tolnay. All rights reserved.
//

import UIKit

extension UIView {
  
  var x: Int {
    get {
      return Int(self.frame.origin.x)
    }
    set {
      frame = CGRect(x: CGFloat(newValue),
                     y: frame.origin.y,
                     width: frame.width,
                     height: frame.height)
    }
  }
  
  var y: Int {
    get {
      return Int(self.frame.origin.y)
    }
    set {
      frame = CGRect(x: frame.origin.x,
                     y: CGFloat(newValue),
                     width: frame.width,
                     height: frame.height)
    }
  }
  
  var width: Int {
    get {
      return Int(self.frame.width)
    }
    set {
      frame = CGRect(x: frame.origin.x,
                     y: frame.origin.y,
                     width: CGFloat(newValue),
                     height: frame.height)
    }
  }
  
  var height: Int {
    get {
      return Int(self.frame.height)
    }
    set {
      frame = CGRect(x: frame.origin.x,
                     y: frame.origin.y,
                     width: frame.width,
                     height: CGFloat(newValue))
    }
  }

}
