//
//  ViewController.swift
//  Life
//
//  Created by Prabhash Singh on 14/08/17.
//  Copyright © 2017 automationlog. All rights reserved.
//

import UIKit


class LifeViewController: UIViewController {

  // MARK: Outlets
  @IBOutlet weak var workSwitch: UISwitch!
  @IBOutlet weak var socialLifeSwitch: UISwitch!
  @IBOutlet weak var sleepSwitch: UISwitch!

  // MARK: Vars
  var switchQueue = Queue<UISwitch>(size: 2)




  // MARK: Overloads
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }


  // MARK: Actions
  @IBAction func updateSwitch(_ sender: UISwitch) {
    var arr = switchQueue.getAllItem()

    if switchQueue.count == 2 && (arr[0].tag == sender.tag || arr[1].tag == sender.tag) {
      return
    }

    if let switchOff = switchQueue.enqueue(sender){
      if arr[0].isOn && arr[1].isOn {
        switchOff.setOn(false, animated: true)
      }
    }
    
  }
  
  
  
}

