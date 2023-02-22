//
//  JournalHelperFunctions.swift
//  Pandemically
//
//  Created by Ryan Luong on 12/11/20.
//  Copyright © 2020 Ryan Luong. All rights reserved.
//

import Foundation

func addUpTheEmoji(list: [Journal]) -> [String: Int] {
    var emojiCount = ["verySad": 0, "sad": 0, "neutral": 0, "happy": 0, "veryHappy": 0]
    for journal in list {
        switch journal.feeling {
        case "verySad":
            emojiCount[journal.feeling]? += 1
        case "sad":
            emojiCount[journal.feeling]? += 1
        case "neutral":
            emojiCount[journal.feeling]? += 1
        case "happy":
            emojiCount[journal.feeling]? += 1
        case "veryHappy":
            emojiCount[journal.feeling]? += 1
        default:
            print("nothing")
        }
    }
    return emojiCount
}

func getMomentsOfRust(list: [Journal]) -> [String] {
    var activitiesRust = [String]()
    for journal in list {
        switch journal.feeling {
        case "verySad":
            activitiesRust += journal.activities
        case "sad":
            activitiesRust += journal.activities
        default:
            print("nothing")
        }
    }
    return activitiesRust
}

func getMomentsOfJoy(list: [Journal]) -> [String] {
    var activitiesJoy = [String]()
    for journal in list {
        switch journal.feeling {
        case "happy":
            activitiesJoy += journal.activities
        case "veryHappy":
            activitiesJoy += journal.activities
        default:
            print("nothing")
        }
    }
    return activitiesJoy
}

func addUpRustMoments(rustActivities: [String]) -> [String: Int] {
    var momentsInRust = ["finance": 0, "health": 0, "leisure": 0, "lovedones": 0, "random": 0, "school": 0, "socialmedia": 0, "work": 0]
    for activity in rustActivities {
        momentsInRust[activity]? += 1
    }
    return momentsInRust
}

func addUpJoyMoments(joyActivities: [String]) -> [String: Int] {
    var momentsInJoy = ["finance": 0, "health": 0, "leisure": 0, "lovedones": 0, "random": 0, "school": 0, "socialmedia": 0, "work": 0]
    for activity in joyActivities {
        momentsInJoy[activity]? += 1
    }
    return momentsInJoy
}

func sortEmojiCount(emojiCount: [String: Int]) -> [(key: String, value: Int)] {
    return emojiCount.sorted { $0.1 > $1.1 }
}

func sortMomentsInRust(momentsInRust: [String: Int]) -> [(key: String, value: Int)] {
    return momentsInRust.sorted { $0.1 > $1.1 }
}

func sortMomentsInJoy(momentsInJoy: [String: Int]) -> [(key: String, value: Int)] {
    return momentsInJoy.sorted { $0.1 > $1.1 }
}
