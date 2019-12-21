//
//  UIView+instantiateFromNib.swift
//  SmartHome
//
//  Created by Roland Tolnay on 04/06/2018.
//

import UIKit

extension UIView {

  static func instantiateFromNib() -> Self {
    return viewFromNib(viewClass: self)
  }
  
  private static func viewFromNib<T: UIView>(viewClass: T.Type) -> T {
    let bundle = Bundle(for: T.self)
    let nib = UINib(nibName: "\(self)", bundle: bundle)
    guard let view = nib.instantiate(withOwner: self, options: nil).first as? T else { fatalError() }
    
    return view
  }
}
