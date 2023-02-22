//
//  pop_up_page.swift
//  Pandemically
//
//  Created by Ryan Luong on 12/9/20.
//  Copyright © 2020 Ryan Luong. All rights reserved.
//

import UIKit

class pop_up_page: UIViewController {
    @IBOutlet var dateLabel: UILabel!

    @IBOutlet var activity1: UIImageView!

    @IBOutlet var activity2: UIImageView!
    @IBOutlet var activity3: UIImageView!
    @IBOutlet var activity4: UIImageView!
    @IBOutlet var mood: UIImageView!
    @IBOutlet var titleField: UITextField!
    @IBOutlet var journalField: UITextField!
    var journalTitle: String = ""
    var journalMessage: String = ""
    var emoji: String = ""
    var activities: [String] = []
    var dateForJournal: String = ""

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
        insertImageToActivityImageView(activity: activities[0], activityImageView: activity1)
        insertImageToActivityImageView(activity: activities[1], activityImageView: activity2)
        insertImageToActivityImageView(activity: activities[2], activityImageView: activity3)
        insertImageToActivityImageView(activity: activities[3], activityImageView: activity4)
        insertImageToEmojiImageView(emoji: emoji, emojiImageView: mood)
        titleField.text = journalTitle
        journalField.text = journalMessage
        dateLabel.text = dateForJournal
        // Do any additional setup after loading the view.
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
