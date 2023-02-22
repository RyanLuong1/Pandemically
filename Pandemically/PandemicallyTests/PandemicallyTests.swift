//
//  PandemicallyTests.swift
//  PandemicallyTests
//
//  Created by Ryan Luong on 12/11/20.
//  Copyright © 2020 Ryan Luong. All rights reserved.
//

@testable import Pandemically
import XCTest

class PandemicallyTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testJournalInitializer() {
        let journal1 = Journal(title: "Title", date: "01/01/2000", activities: ["leisure", "health"], message: "Test message", feeling: "neutral")
        XCTAssertEqual(journal1.title, "Title")
        XCTAssertEqual(journal1.date, "01/01/2000")
        XCTAssertEqual(journal1.activities, ["leisure", "health"])
        XCTAssertEqual(journal1.message, "Test message")
        XCTAssertEqual(journal1.feeling, "neutral")
    }

    func testAddUpEmojiCount() {
        let emojiCount1 = ["verySad": 1, "sad": 0, "neutral": 1, "happy": 0, "veryHappy": 1]
        let journalList = [Journal(title: "", date: "", activities: [], message: "", feeling: "verySad"), Journal(title: "", date: "", activities: [], message: "", feeling: "neutral"), Journal(title: "", date: "", activities: [], message: "", feeling: "veryHappy")]
        let emojiCount2 = addUpTheEmoji(list: journalList)
        XCTAssertEqual(emojiCount1, emojiCount2)
    }

    func testGetMomentsOfRust() {
        let activitiesRust1 = ["leisure", "health"]
        let journalList = [Journal(title: "", date: "", activities: ["leisure", "health"], message: "", feeling: "verySad")]
        let activitiesRust2 = getMomentsOfRust(list: journalList)
        XCTAssertEqual(activitiesRust1, activitiesRust2)
    }

    func testGetMomentsOfJoy() {
        let activitiesJoy1 = ["leisure", "health"]
        let journalList = [Journal(title: "", date: "", activities: ["leisure", "health"], message: "", feeling: "happy")]
        let activitiesJoy2 = getMomentsOfJoy(list: journalList)
        XCTAssertEqual(activitiesJoy1, activitiesJoy2)
    }

    func testAddUpRustMoments() {
        let momentsOfRust1 = ["finance": 1, "health": 0, "leisure": 0, "lovedones": 0, "random": 0, "school": 0, "socialmedia": 1, "work": 0]
        let rustActivities = ["finance", "socialmedia"]
        let momentsOfRust2 = addUpRustMoments(rustActivities: rustActivities)
        XCTAssertEqual(momentsOfRust1, momentsOfRust2)
    }

    func testAddUpJoyMoments() {
        let momentsOfJoy1 = ["finance": 1, "health": 0, "leisure": 0, "lovedones": 0, "random": 0, "school": 0, "socialmedia": 1, "work": 0]
        let joyActivities = ["finance", "socialmedia"]
        let momentsOfJoy2 = addUpJoyMoments(joyActivities: joyActivities)
        XCTAssertEqual(momentsOfJoy1, momentsOfJoy2)
    }

    func testSave() {
        let journalList = [Journal(title: "", date: "", activities: [], message: "", feeling: "verySad")]
        save(journalList: journalList)
        do {
            let fileURL = try FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("journalEntries.json")
            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let items = try decoder.decode([Journal].self, from: data)
            XCTAssertEqual(journalList[0].feeling, items[0].feeling)
        } catch {
            print(error.localizedDescription)
            XCTFail()
        }
    }

    func testLoad() {
        let journalList = [Journal(title: "", date: "", activities: [], message: "", feeling: "verySad")]
        do {
            let fileURL = try FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("journalEntries.json")
            let encoder = JSONEncoder()
            try encoder.encode(journalList).write(to: fileURL)
        } catch {
            print(error.localizedDescription)
            XCTFail()
        }
        let journalListTest: [Journal] = read()
        XCTAssertEqual(journalList[0].feeling, journalListTest[0].feeling)
    }
}
