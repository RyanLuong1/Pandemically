//
//  interactive_3rd_page.swift
//  Pandemically
//
//  Created by Ryan Luong on 10/29/20.
//  Copyright © 2020 Ryan Luong. All rights reserved.
//

import UIKit

class interactive_3rd_page: UIViewController, UITextFieldDelegate {
    var emoji: String = ""
    var activities: [String] = []
    var image: UIImageView?
    var dateForJournal: String = ""
    @IBOutlet var dateAndTimeLabel: UILabel! {
        didSet {
            dateAndTimeLabel.text = ""
        }
    }

    @IBOutlet var activity1: UIImageView!
    @IBOutlet var activity2: UIImageView!
    @IBOutlet var activity3: UIImageView!
    @IBOutlet var activity4: UIImageView!
    @IBOutlet var mood_imageview: UIImageView!
    @IBOutlet var mood_stackview: UIStackView!

    @IBOutlet var titleField: UITextField! {
        didSet {
            titleField.delegate = self
        }
    }

    @IBOutlet var journalField: UITextField! {
        didSet {
            journalField.delegate = self
        }
    }

    @IBOutlet var completeButton: UIButton! {
        didSet {
            completeButton.isEnabled = false
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if titleField.text?.isEmpty != nil, journalField.text?.isEmpty != nil {
            completeButton.isEnabled = true
        } else {
            completeButton.isEnabled = false
        }
    }

    func insertImageToActivityImageView(activity: String, activityImageView: UIImageView) {
        switch activity {
            case "finance":
                activityImageView.image = UIImage(named: "finance")
            case "health":
                activityImageView.image = UIImage(named: "health")
            case "leisure":
                activityImageView.image = UIImage(named: "leisure")
            case "lovedones":
                activityImageView.image = UIImage(named: "lovedones")
            case "random":
                activityImageView.image = UIImage(named: "random")
            case "school":
                activityImageView.image = UIImage(named: "school")
            case "socialmedia":
                activityImageView.image = UIImage(named: "socialmedia")
            case "work":
                activityImageView.image = UIImage(named: "work")
            default:
                print("Nothing")
        }
    }

    func insertImageToEmojiImageView(emoji: String, emojiImageView: UIImageView) {
        switch emoji {
            case "verySad":
                emojiImageView.image = UIImage(named: "0")
            case "sad":
                emojiImageView.image = UIImage(named: "1")
            case "happy":
                emojiImageView.image = UIImage(named: "3")
            case "veryHappy":
                emojiImageView.image = UIImage(named: "4")
            default:
                emojiImageView.image = UIImage(named: "2")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let date = Date()
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        formatter.locale = .current

        dateAndTimeLabel.text = formatter.string(from: date)
        dateForJournal = formatter.string(from: date)
        insertImageToActivityImageView(activity: activities[0], activityImageView: activity1)
        insertImageToActivityImageView(activity: activities[1], activityImageView: activity2)
        insertImageToActivityImageView(activity: activities[2], activityImageView: activity3)
        insertImageToActivityImageView(activity: activities[3], activityImageView: activity4)
        insertImageToEmojiImageView(emoji: emoji, emojiImageView: mood_imageview)
    }

    @IBAction func completeButton(_ sender: Any) {
        guard let titleText = titleField.text else {
            completeButton.isEnabled = false
            return
        }
        guard let journalText = journalField.text else {
            completeButton.isEnabled = false
            return
        }
        let newJournal = Journal(title: titleText, date: dateForJournal, activities: activities, message: journalText, feeling: emoji)
        var journalList = read()
        journalList.append(newJournal)
        save(journalList: journalList)

        performSegue(withIdentifier: "unwindToHomePage", sender: self)
    }

}
