//
//  interactive_1st_page.swift
//  Pandemically
//
//  Created by Ryan Luong on 10/29/20.
//  Copyright © 2020 Ryan Luong. All rights reserved.
//

import UIKit

class interactive_1st_page: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    var emoji: String = ""
    var maxEmojiAllowed: Int = 0
    @IBOutlet var verySadbtnImage: UIButton! {
        didSet {
            verySadbtnImage.setImage(UIImage(named: "0"), for: .normal)
        }
    }
    
    @IBOutlet var sadbtnImage: UIButton! {
        didSet {
            sadbtnImage.setImage(UIImage(named: "1"), for: .normal)
        }
    }
    
    @IBOutlet var neutralbtnImage: UIButton! {
        didSet {
            neutralbtnImage.setImage(UIImage(named: "2"), for: .normal)
        }
    }
    
    @IBOutlet var happybtnImage: UIButton! {
        didSet {
            happybtnImage.setImage(UIImage(named: "3"), for: .normal)
        }
    }
    
    @IBOutlet var veryHappybtnImage: UIButton! {
        didSet {
            veryHappybtnImage.setImage(UIImage(named: "4"), for: .normal)
        }
    }
    
    func setBtnImageToBlackAndWhite(outlet: UIButton, imageName: String, emojiName: String) {
        outlet.setImage(UIImage(named: imageName), for: .normal)
        emoji = emojiName
        maxEmojiAllowed += 1
    }
    
    func setBtnImageToOriginal(outlet: UIButton, imageName: String) {
        outlet.setImage(UIImage(named: imageName), for: .normal)
        emoji = ""
        maxEmojiAllowed -= 1
    }
    
    @IBAction func verySadbtnImageAction(_ sender: Any) {
        let currentBtnImage = verySadbtnImage.image(for: .normal)
        let verySadImage = UIImage(named: "0")
        guard currentBtnImage == verySadImage else {
            setBtnImageToOriginal(outlet: verySadbtnImage, imageName: "0")
            return
        }
    
        guard maxEmojiAllowed == 0 else {
            return
        }
        
        setBtnImageToBlackAndWhite(outlet: verySadbtnImage, imageName: "verySadFilledImage", emojiName: "verySad")
    }
    
    @IBAction func sadbtnImageAction(_ sender: Any) {
        let currentBtnImage = sadbtnImage.image(for: .normal)
        let sadImage = UIImage(named: "1")
        guard currentBtnImage == sadImage else {
            setBtnImageToOriginal(outlet: sadbtnImage, imageName: "1")
            return
        }
        
        guard maxEmojiAllowed == 0 else {
            return
        }
        
        setBtnImageToBlackAndWhite(outlet: sadbtnImage, imageName: "sadFilledImage", emojiName: "sad")
    }
    
    @IBAction func neutralbtnImageAction(_ sender: Any) {
        let currentBtnImage = neutralbtnImage.image(for: .normal)
        let neutralImage = UIImage(named: "2")
        guard currentBtnImage == neutralImage else {
            setBtnImageToOriginal(outlet: neutralbtnImage, imageName: "2")
            return
        }
        
        guard maxEmojiAllowed == 0 else {
            return
        }
        
        setBtnImageToBlackAndWhite(outlet: neutralbtnImage, imageName: "neutralFilledImage", emojiName: "neutral")
    }
    
    @IBAction func happybtnImageAction(_ sender: Any) {
        let currentBtnImage = happybtnImage.image(for: .normal)
        let happyImage = UIImage(named: "3")
        guard currentBtnImage == happyImage else {
            setBtnImageToOriginal(outlet: happybtnImage, imageName: "3")
            return
        }
    
        guard maxEmojiAllowed == 0 else {
            return
        }
        
        setBtnImageToBlackAndWhite(outlet: happybtnImage, imageName: "happyFilledImage", emojiName: "happy")
    }
    
    @IBAction func veryHappybtnImageAction(_ sender: Any) {
        let currentBtnImage = veryHappybtnImage.image(for: .normal)
        let veryHappyImage = UIImage(named: "4")
        guard currentBtnImage == veryHappyImage else {
            setBtnImageToOriginal(outlet: veryHappybtnImage, imageName: "4")
            return
        }
        
        guard maxEmojiAllowed == 0 else {
            return
        }
        
        setBtnImageToBlackAndWhite(outlet: veryHappybtnImage, imageName: "veryHappyFilledImage", emojiName: "veryHappy")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var dataForSecondPage = segue.destination as! interactive_2nd_page
        dataForSecondPage.emoji = emoji
    }
}
