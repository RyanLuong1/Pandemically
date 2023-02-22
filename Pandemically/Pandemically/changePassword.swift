//
//  changePassword.swift
//  Pandemically
//
//  Created by Nurhaliza Hassan on 11/29/20.
//  Copyright © 2020 Ryan Luong. All rights reserved.
//

import UIKit

class ChangePassword: UIViewController, UITextFieldDelegate {
    @IBOutlet var currentPasswordTextField: UITextField! {
        didSet {
            currentPasswordTextField.delegate = self
            currentPasswordTextField.text = ""
            currentPasswordTextField.placeholder = "Current Password"
            currentPasswordTextField.isSecureTextEntry = true
        }
    }
    
    @IBOutlet var newPasswordTextField: UITextField! {
        didSet {
            newPasswordTextField.delegate = self
            newPasswordTextField.text = ""
            newPasswordTextField.placeholder = "New Password"
            newPasswordTextField.isSecureTextEntry = true
        }
    }
    
    @IBOutlet var confirmNewPasswordTextField: UITextField! {
        didSet {
            confirmNewPasswordTextField.delegate = self
            confirmNewPasswordTextField.text = ""
            confirmNewPasswordTextField.placeholder = "Re-confirm New Password"
            confirmNewPasswordTextField.isSecureTextEntry = true
        }
    }
    
    @IBOutlet var updateButton: UIButton!
    
    @objc func MatchingPassword(_ textfield: UITextField) {
        guard newPasswordTextField.text != nil else {
            return
        }
        if textfield == confirmNewPasswordTextField {
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newPasswordTextField.addTarget(self, action: #selector(MatchingPassword(_:)), for: UIControl.Event.editingChanged)
        confirmNewPasswordTextField.addTarget(self, action: #selector(MatchingPassword(_:)), for: UIControl.Event.editingChanged)
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
        if newPasswordTextField.text! == confirmNewPasswordTextField.text! {
            print("Password has been updated.")
        } else {
            let alert = UIAlertController(title: "Uh-Oh!", message: "Invalid Password. Please try again.", preferredStyle: .alert)
            let response = UIAlertAction(title: "OK.", style: .default, handler: nil)
            alert.addAction(response)
            present(alert, animated: true, completion: nil)
        }
    }
}
