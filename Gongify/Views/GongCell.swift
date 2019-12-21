//
//  GongCell.swift
//  Gongify
//
//  Created by Roland Tolnay on 20/06/2018.
//  Copyright © 2018 Roland Tolnay. All rights reserved.
//

import UIKit

class GongCell: UITableViewCell {
  
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet var weekdayLabels: [WeekdayLabel]!
  @IBOutlet weak var gongImageView: UIImageView!
  @IBOutlet weak var timeLabel: TimeLabel!
  
  private var gongTransform: CGAffineTransform?
  private var gong: Gong!
  
  var onTimeLabelTapped: ((Gong, GongCell) -> Void)?
  var onDescriptionTapped: ((Gong, GongCell) -> Void)?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    let gestureTimeLabel = UITapGestureRecognizer(target: self,
                                                  action: #selector(GongCell.onTimeLabelTapped(_:)))
    timeLabel.addGestureRecognizer(gestureTimeLabel)
    
    let gestureDescription = UITapGestureRecognizer(target: self,
                                                    action: #selector(GongCell.onDescriptionTapped(_:)))
    descriptionLabel.addGestureRecognizer(gestureDescription)
  }
  
  @objc private func onTimeLabelTapped(_ sender: UITapGestureRecognizer) {
    
    print("Time Label tapped")
    onTimeLabelTapped?(gong, self)
  }
  
  @objc private func onDescriptionTapped(_ sender: UITapGestureRecognizer) {
    
    print("Description tapped")
    onDescriptionTapped?(gong, self)
  }
  
  func setup(with gong: Gong) {
    
    self.gong = gong
    descriptionLabel.text = gong.description
    let trigger = gong.trigger
    trigger.weekdays.forEach { weekday in
      if let label = viewWithTag(weekday.rawValue) as? WeekdayLabel {
        label.isSelected = true
      }
    }
    timeLabel.time = trigger.time
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    
    if selected {
      onDescriptionTapped?(gong, self)
    }
//    if selected,
//      let transform = gongTransform {
//      animateGong(in: gongImageView, using: transform)
//    }
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    gongTransform = gongImageView.transform
  }
}

extension GongCell {
  
  private func animateGong(in imageView: UIImageView,
                           using transform: CGAffineTransform) {
    
    UIView.animate(withDuration: 0.5, animations: {
      imageView.transform = transform.scaledBy(x: 1.3, y: 1.3)
    }, completion: { success in
      if success {
        UIView.animate(withDuration: 0.4, animations: {
          imageView.transform = transform
        })
      }
    })
  }
}
