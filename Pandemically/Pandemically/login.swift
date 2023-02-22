//
//  login.swift
//  Pandemically
//
//  Created by Nurhaliza Hassan & Mikias Zeleke on 12/5/20.
//  Copyright © 2020 Ryan Luong. All rights reserved.
//

import UIKit

class login: UIViewController, UITextFieldDelegate {
    @IBOutlet var usernameTextField: UITextField! {
        didSet {
            usernameTextField.delegate = self
            usernameTextField.text = ""
            usernameTextField.placeholder = ""
        }
    }

    @IBOutlet var passwordTextField: UITextField! {
        didSet {
            passwordTextField.delegate = self
            passwordTextField.text = ""
            passwordTextField.placeholder = ""
            passwordTextField.isSecureTextEntry = true
        }
    }

    @IBOutlet var signinButton: UIButton!
    
    let defaultUsername: String = "sirsavagethe21st"
    let defaultPassword: String = "NOyeezy2024"
    /*
     func checkLogin(email: String, password: String) -> Bool {
         return email == emailKey && password == passwordKey
     }
     */

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    
    @IBAction func onClickLogin(_ sender: Any) {
        if defaultUsername == usernameTextField.text!, defaultPassword == passwordTextField.text! {
            print("Valid Username and Password.")
        } else {
            let alert = UIAlertController(title: "Uh-Oh!", message: "Invalid Username and/or Password. Please try again.", preferredStyle: .alert)
            let response = UIAlertAction(title: "OK.", style: .default, handler: nil)
            alert.addAction(response)
            present(alert, animated: true, completion: nil)
        }
    }
}
