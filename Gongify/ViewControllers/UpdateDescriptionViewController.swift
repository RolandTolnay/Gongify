//
//  UpdateDescriptionViewController.swift
//  Gongify
//
//  Created by Roland Tolnay on 21/06/2018.
//  Copyright © 2018 Roland Tolnay. All rights reserved.
//

import UIKit

class UpdateDescriptionViewController: UIViewController {
  
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
  var descriptionTextView: UITextView = {
    
    let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    textView.font = UIFont(name: "NunitoSans-Regular", size: 36)
    textView.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    textView.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    textView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
    textView.returnKeyType = UIReturnKeyType.done
    textView.alpha = 0
    return textView
  }()
  
  var gong: Gong!
  private lazy var gongDescription: String = gong.description
  var onDismissed: ((String?) -> Void)?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
    hideKeyboardWhenTappedArround()
    descriptionTextView.text = gongDescription
    
    let tap = UITapGestureRecognizer(target: self, action: #selector(UpdateDescriptionViewController.onBlurViewTapped))
    self.view.addGestureRecognizer(tap)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    descriptionTextView.becomeFirstResponder()
    UIView.animate(withDuration: 0.2) {
      self.descriptionTextView.alpha = 1
    }
  }
  
  @objc private func onBlurViewTapped(_ sender: UITapGestureRecognizer) {
    
    onDismissed?(descriptionTextView.text)
    dismissKeyboard()
    dismiss(animated: true, completion: nil)
  }
}

extension UpdateDescriptionViewController {
  
  private func setupView() {
    
    blurEffectView.frame = view.bounds
    view.addSubview(blurEffectView)
    
    cardView.frame = IBCardView.frame
    view.addSubview(cardView)
    
    descriptionTextView.width = cardView.width - 48
    descriptionTextView.center = cardView.center
    view.addSubview(descriptionTextView)
  }
  
  func setupHero(additions: ((UpdateDescriptionViewController) -> Void)?) {
    
    hero.isEnabled = true
    blurEffectView.hero.modifiers = [.fade]
    additions?(self)
  }
}
