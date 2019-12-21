//
//  WeekdayLabel.swift
//  Created
//
//  Created by Roland Tolnay on 20/06/2018.
//

import UIKit

@IBDesignable
class WeekdayLabel: UILabel {

  var weekday: Weekday! {
    return Weekday(rawValue: tag)
  }

  @IBInspectable
  var isSelected: Bool = false {
    didSet {
      updateIfSelected()
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    updateIfSelected()
  }
  
  private let fontSize: CGFloat = 18.0
  
  private func updateIfSelected() {
    if isSelected {
      font = UIFont(name: "NunitoSans-ExtraBold", size: fontSize)
      textColor = #colorLiteral(red: 0.01784582622, green: 0.6800052524, blue: 0.5928025842, alpha: 1)
    } else {
      font = UIFont(name: "NunitoSans-ExtraLight", size: fontSize)
      textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
    }
  }
}
