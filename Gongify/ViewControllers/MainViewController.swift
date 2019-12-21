//
//  ViewController.swift
//  Gongify
//
//  Created by Roland Tolnay on 17/06/2018.
//  Copyright © 2018 Roland Tolnay. All rights reserved.
//

import UIKit
import ReSwift
import Hero

class MainViewController: UIViewController, StoreSubscriber {
  
  @IBOutlet private weak var tableView: UITableView!
  
  private var gongs = [Gong]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 180
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    store.subscribe(self)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    store.unsubscribe(self)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
  
  func newState(state: AppState) {
    
    gongs = state.gongs
    tableView.reloadData()
  }
}

extension MainViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return gongs.count + 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if indexPath.row == gongs.count,
      let cell = tableView.dequeueReusableCell(withIdentifier: AddNewGongCell.identifier,
                                               for: indexPath) as? AddNewGongCell {
      
      return cell
    } else if let cell = tableView.dequeueReusableCell(withIdentifier: GongCell.identifier,
                                                       for: indexPath) as? GongCell {
      
      let gong = gongs[indexPath.row]
      cell.setup(with: gong)
      
      let heroIdTime = "time-label-cell-\(indexPath.row)"
      cell.onTimeLabelTapped = { [weak self] gong, gongCell in
        
        gongCell.timeLabel.hero.id = heroIdTime
        let updateTimeViewController = UpdateTimeViewController.instantiate()
        updateTimeViewController.gong = gong
        updateTimeViewController.setupHero(additions: { updateTimeViewController in
          updateTimeViewController.cardView.hero.id = heroIdTime
        })
        updateTimeViewController.onDismissed = { time in
          store.dispatch(
            GongActionUpdateTime(time: time, gong: gong)
          )
        }
        
        self?.present(updateTimeViewController, animated: true, completion: nil)
      }
      
      // TODO: Animate better
      let heroIdDesc = "desc-cell-\(indexPath.row)"
      cell.onDescriptionTapped = { [weak self] gong, gongCell in
        
        gongCell.gongImageView.hero.id = heroIdDesc
        gongCell.descriptionLabel.hero.modifiers = [.whenDisappearing(.fade)]
        let updateDescriptionViewController = UpdateDescriptionViewController.instantiate()
        updateDescriptionViewController.gong = gong
        updateDescriptionViewController.setupHero(additions: { updateDescriptionViewController in
          
          updateDescriptionViewController.cardView.hero.id = heroIdDesc
          updateDescriptionViewController.hero.modalAnimationType = .fade
          updateDescriptionViewController.cardView.hero.modifiers = [.fade]
        })
        updateDescriptionViewController.onDismissed = { gongDescription in
          
          gongCell.descriptionLabel.hero.modifiers = [.whenAppearing(.fade)]
          
          if let desc = gongDescription {
            store.dispatch(
              GongActionUpdateDescription(gongDescription: desc, gong: gong)
            )
          }
        }
        
        self?.present(updateDescriptionViewController, animated: true, completion: nil)
      }
      
      return cell
    }
    
    return UITableViewCell()
  }
}

extension MainViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    if indexPath.row == gongs.count,
      let _ = tableView.dequeueReusableCell(withIdentifier: AddNewGongCell.identifier,
                                            for: indexPath) as? AddNewGongCell {
      
      let hour = Int(arc4random_uniform(23))
      let minute = Int(arc4random_uniform(59))
      let time = Time(hour: hour, minute: minute)
      store.dispatch(
        GongActionCreate(description: "My first Gong",
                         time: time,
                         weekdays: [
                          //swiftlint:disable force_unwrapping
                          Weekday(rawValue: Int(arc4random_uniform(6)) + 1)!,
                          Weekday(rawValue: Int(arc4random_uniform(6)) + 1)!,
                          Weekday(rawValue: Int(arc4random_uniform(6)) + 1)!
          ])
      )
    }
  }
}
