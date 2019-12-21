//
//  EditGongViewController.swift
//  Gongify
//
//  Created by Roland Tolnay on 20/06/2018.
//  Copyright © 2018 Roland Tolnay. All rights reserved.
//

import UIKit

class UpdateTimeViewController: UIViewController {
  
  @IBOutlet private weak var IBCardView: UIView!
  
  var blurEffectView: UIVisualEffectView = {
    
    let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
    let blurEffectView = UIVisualEffectView(effect: blurEffect)
    blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    return blurEffectView
  }()
  
  var cardView: UIView = {
    
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0.01784582622, green: 0.6800052524, blue: 0.5928025842, alpha: 1)
    view.cornerRadius = 15
    view.translatesAutoresizingMaskIntoConstraints = false
    
    return view
  }()
  var timeTextField: TimeTextField = {
    
    let textfield = TimeTextField(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
    textfield.font = UIFont(name: "NunitoSans-ExtraBold", size: 72)
    textfield.textColor = .white
    textfield.tintColor = .white
    textfield.keyboardType = UIKeyboardType.decimalPad
    textfield.returnKeyType = UIReturnKeyType.done
    textfield.alpha = 0
    return textfield
  }()
  
  var gong: Gong!
  private lazy var time: Time = gong.trigger.time
  var onDismissed: ((Time) -> Void)?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
    hideKeyboardWhenTappedArround()
    timeTextField.text = time.description
    
    let tap = UITapGestureRecognizer(target: self, action: #selector(UpdateTimeViewController.onBlurViewTapped))
    self.view.addGestureRecognizer(tap)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    timeTextField.becomeFirstResponder()
    UIView.animate(withDuration: 0.2) {
      self.timeTextField.alpha = 1.0
    }
  }
  
  func setupHero(additions: ((UpdateTimeViewController) -> Void)?) {
    
    hero.isEnabled = true
    blurEffectView.hero.modifiers = [.fade]
    additions?(self)
  }
  
  @objc private func onBlurViewTapped(_ sender: UITapGestureRecognizer) {
    
    if let updatedTime = timeTextField.text?.time {
      onDismissed?(updatedTime)
    } else {
      // TODO: Shake textfield
      onDismissed?(time)
    }
    dismissKeyboard()
    dismiss(animated: true, completion: nil)
  }
}

extension UpdateTimeViewController {
  
  private func setupView() {
    
    blurEffectView.frame = view.bounds
    view.addSubview(blurEffectView)
    
    cardView.frame = IBCardView.frame
    view.addSubview(cardView)
    
    timeTextField.center = cardView.center
    view.addSubview(timeTextField)
  }
}
