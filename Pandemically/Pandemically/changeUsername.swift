//
//  changeUsername.swift
//  Pandemically
//
//  Created by Nurhaliza Hassan on 11/29/20.
//  Copyright © 2020 Ryan Luong. All rights reserved.
//

import UIKit

class ChangeUsername: UIViewController, UITextFieldDelegate {
    @IBOutlet var currentUsernameText: UITextField! {
        didSet {
            currentUsernameText.delegate = self
            currentUsernameText.text = ""
            currentUsernameText.placeholder = "Current Username"
        }
    }
    
    @IBOutlet var newUsernameText: UITextField! {
        didSet {
            newUsernameText.delegate = self
            newUsernameText.text = ""
            newUsernameText.placeholder = "New Username"
        }
    }
    
    @IBOutlet var confirmNewUsernameText: UITextField! {
        didSet {
            confirmNewUsernameText.delegate = self
            confirmNewUsernameText.text = ""
            confirmNewUsernameText.placeholder = "Re-confirm New Username"
        }
    }
    
    @IBOutlet var updateBtn: UIButton!
    
    @objc func MatchingUsername(_ textfield: UITextField) {
        guard newUsernameText.text != nil else {
            return
        }
        if textfield == confirmNewUsernameText {
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newUsernameText.addTarget(self, action: #selector(MatchingUsername(_:)), for: UIControl.Event.editingChanged)
        confirmNewUsernameText.addTarget(self, action: #selector(MatchingUsername(_:)), for: UIControl.Event.editingChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
      
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
      
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onClickUpdate(_ sender: Any) {
        if newUsernameText.text! == confirmNewUsernameText.text! {
            print("Username has been updated.")
        } else {
            let alert = UIAlertController(title: "Uh-Oh!", message: "Invalid Username. Please try again.", preferredStyle: .alert)
            let response = UIAlertAction(title: "OK.", style: .default, handler: nil)
            alert.addAction(response)
            present(alert, animated: true, completion: nil)
        }
    }
}
