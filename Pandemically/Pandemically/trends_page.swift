//
//  trends_page.swift
//  Pandemically
//
//  Created by Ryan Luong on 11/30/20.
//  Copyright © 2020 Ryan Luong. All rights reserved.
//

import UIKit

class trends_page: UIViewController {
    // finance, health, leisure, loved_ones, random, school, social media, work
    @IBOutlet var overallMood: UIImageView!
    @IBOutlet var firstJoy: UIImageView!

    @IBOutlet var secondJoy: UIImageView!
    @IBOutlet var thirdJoy: UIImageView!
    @IBOutlet var firstRust: UIImageView!
    @IBOutlet var secondRust: UIImageView!
    @IBOutlet var thirdRust: UIImageView!

    func insertJoyMomentsImageToImageView(joyMoment: String, joyUIImageView: UIImageView) {
        switch joyMoment {
        case "finance":
            joyUIImageView.image = UIImage(named: "finance")
        case "health":
            joyUIImageView.image = UIImage(named: "health")
        case "leisure":
            joyUIImageView.image = UIImage(named: "leisure")
        case "lovedones":
            joyUIImageView.image = UIImage(named: "lovedones")
        case "random":
            joyUIImageView.image = UIImage(named: "random")
        case "school":
            joyUIImageView.image = UIImage(named: "school")
        case "socialmedia":
            joyUIImageView.image = UIImage(named: "socialmedia")
        case "work":
            joyUIImageView.image = UIImage(named: "work")
        default:
            print("nothing")
        }
    }

    func insertRustMomentsImageToImageView(rustMoment: String, rustUIImageView: UIImageView) {
        switch rustMoment {
        case "finance":
            rustUIImageView.image = UIImage(named: "finance")
        case "health":
            rustUIImageView.image = UIImage(named: "health")
        case "leisure":
            rustUIImageView.image = UIImage(named: "leisure")
        case "lovedones":
            rustUIImageView.image = UIImage(named: "lovedones")
        case "random":
            rustUIImageView.image = UIImage(named: "random")
        case "school":
            rustUIImageView.image = UIImage(named: "school")
        case "socialmedia":
            rustUIImageView.image = UIImage(named: "socialmedia")
        case "work":
            rustUIImageView.image = UIImage(named: "work")
        default:
            print("nothing")
        }
    }

    func insertEmojiImageToImageView(emoji: String, emojiUIImageView: UIImageView) {
        switch emoji {
        case "verySad":
            emojiUIImageView.image = UIImage(named: "0")
        case "sad":
            emojiUIImageView.image = UIImage(named: "1")
        case "neutral":
            emojiUIImageView.image = UIImage(named: "2")
        case "happy":
            emojiUIImageView.image = UIImage(named: "3")
        case "veryHappy":
            emojiUIImageView.image = UIImage(named: "4")
        default:
            print("nothing")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        var journal1 = Journal(title: "Hey", date: "12/1/00", activities: ["finance", "health", "lovedones", "school"], message: "", feeling: "verySad")
        var journal2 = Journal(title: "Hey", date: "12/1/00", activities: ["lovedones", "random", "socialmedia", "work"], message: "", feeling: "verySad")
        var journal3 = Journal(title: "Hey", date: "12/1/00", activities: ["work", "random", "health", "leisure"], message: "", feeling: "verySad")
        var journal4 = Journal(title: "Hey", date: "12/1/00", activities: ["work"], message: "", feeling: "sad")
        var journal5 = Journal(title: "Hey", date: "12/1/00", activities: ["lovedones"], message: "", feeling: "sad")
        var journal6 = Journal(title: "Hey", date: "12/1/00", activities: ["health", "random", "school", "leisure"], message: "", feeling: "happy")
        var journal7 = Journal(title: "Hey", date: "12/1/00", activities: ["health", "finance", "random", "school"], message: "", feeling: "happy")
        var journal8 = Journal(title: "Hey", date: "12/1/00", activities: ["work"], message: "", feeling: "sad")
        var journal9 = Journal(title: "Hey", date: "12/1/00", activities: ["school"], message: "", feeling: "verySad")
        var journal10 = Journal(title: "Hey", date: "12/1/00", activities: ["socialmedia"], message: "", feeling: "verySad")

        // Read from a file and append it to journalList
        var journalList = [Journal]()
        var emojiCount = addUpTheEmoji(list: journalList)
        var activitiesRust = getMomentsOfRust(list: journalList)
        var activitiesJoy = getMomentsOfJoy(list: journalList)
        var momentsInRust = addUpRustMoments(rustActivities: activitiesRust)
        var momentsInJoy = addUpJoyMoments(joyActivities: activitiesJoy)

        let sortedEmojiCount = sortEmojiCount(emojiCount: emojiCount)
        let sortedRustMoments = sortMomentsInRust(momentsInRust: momentsInRust)
        let sortedJoyMoments = sortMomentsInJoy(momentsInJoy: momentsInJoy)
        insertJoyMomentsImageToImageView(joyMoment: sortedJoyMoments[0].key, joyUIImageView: firstJoy)
        insertJoyMomentsImageToImageView(joyMoment: sortedJoyMoments[1].key, joyUIImageView: secondJoy)
        insertJoyMomentsImageToImageView(joyMoment: sortedJoyMoments[2].key, joyUIImageView: thirdJoy)
        insertRustMomentsImageToImageView(rustMoment: sortedRustMoments[0].key, rustUIImageView: firstRust)
        insertRustMomentsImageToImageView(rustMoment: sortedRustMoments[1].key, rustUIImageView: secondRust)
        insertRustMomentsImageToImageView(rustMoment: sortedRustMoments[2].key, rustUIImageView: thirdRust)
        insertEmojiImageToImageView(emoji: sortedEmojiCount[0].key, emojiUIImageView: overallMood)
    }
}
