//
//  JSONHelperFunction.swift
//  Pandemically
//
//  Created by Ryan Luong on 12/8/20.
//  Copyright © 2020 Ryan Luong. All rights reserved.
//

import Foundation

func read() -> [Journal] {
    var journalList: [Journal] = {
        do {
            let fileURL = try FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("journalEntries.json")
            print(fileURL)
            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let items = try decoder.decode([Journal].self, from: data)
            return items
        } catch {
            print(error.localizedDescription)
            return []
        }
    }()
    return journalList
}

func save(journalList: [Journal]) {
    do {
        let fileURL = try FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("journalEntries.json")
        print(fileURL)
        let encoder = JSONEncoder()
        try encoder.encode(journalList).write(to: fileURL)
    } catch {
        print(error.localizedDescription)
    }
}
