//
//  notifications.swift
//  Pandemically
//
//  Created by Nurhaliza Hassan on 11/29/20.
//  Copyright © 2020 Ryan Luong. All rights reserved.
//

// import Foundation

import UIKit
class Notifications: UIViewController {
    // boolean value that determines the off/on state of the switch
    // var isOn: Bool
    // set the state of the switch to On or Off, optionally animating the transition
    // func setOn(_ on: Bool, animated: Bool) { }

    @IBOutlet var switchMessage: UILabel! {
        didSet {
            switchMessage.text = ""
        }
    }

    @IBAction func switchNotifications(_ sender: UISwitch!) {
        if sender.isOn == true {
            switchMessage.text = "You have turned ON notifications."
        } else {
            switchMessage.text = "You have turned OFF notifications."
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
