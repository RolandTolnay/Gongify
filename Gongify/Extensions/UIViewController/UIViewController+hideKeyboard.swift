//
//  UIViewController+hideKeyboard.swift
//  SmartHome
//
//  Created by Roland Tolnay on 03/06/2018.
//

import UIKit

extension UIViewController {
  
  func hideKeyboardWhenTappedArround() {
    
    let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
    self.view.addGestureRecognizer(tap)
  }
  
  @objc func dismissKeyboard() {
    
    self.view.endEditing(true)
  }
}
