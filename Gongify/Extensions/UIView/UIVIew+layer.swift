//
//  UIView+Layer.swift
//  ICC
//
//  Created by Zoltan Ulrich on 30/01/2018.
//  Copyright © 2018 iQuest Technologies. All rights reserved.
//

import UIKit

extension UIView {
  
  @IBInspectable var cornerRadius: CGFloat {
    get {
      return layer.cornerRadius
    }
    set {
      layer.cornerRadius = newValue
      layer.masksToBounds = newValue > 0
    }
  }
  
  @IBInspectable var borderWidth: CGFloat {
    get {
      return layer.borderWidth
    }
    set {
      layer.borderWidth = newValue
    }
  }
  
  @IBInspectable var borderColor: UIColor? {
    get {
      let borderColor: CGColor! = layer.borderColor
      return UIColor(cgColor: borderColor)
    }
    set {
      layer.borderColor = newValue?.cgColor
    }
  }
  
  @IBInspectable var shadowOffset: CGSize {
    get {
      return layer.shadowOffset
    }
    set {
      layer.shadowOffset = newValue
    }
  }
  
  @IBInspectable var shadowRadius: CGFloat {
    get {
      return layer.shadowRadius
    }
    set {
      layer.shadowRadius = newValue
    }
  }
  
  @IBInspectable var shadowOpacity: Float {
    get {
      return layer.shadowOpacity
    }
    set {
      layer.shadowOpacity = newValue
    }
  }
  
  @IBInspectable var shadowColor: UIColor? {
    get {
      if let cgColor = layer.shadowColor {
        return UIColor(cgColor: cgColor)
      } else {
        return nil
      }
    }
    set {
      layer.shadowColor = newValue?.cgColor
    }
  }
}
