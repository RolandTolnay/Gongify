//
//  UIViewController+instantiate.swift
//  SmartHome
//
//  Created by Roland Tolnay on 16/05/2018.
//

import UIKit

extension UIViewController {
  
  static func instantiate() -> Self {
    return viewController(viewControllerClass: self)
  }
  
  private static func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T {
    let storyboard = UIStoryboard(name: "\(self)", bundle: Bundle.main)
    guard let scene = storyboard.instantiateInitialViewController() as? T else { fatalError() }
    
    return scene
  }
}
