//
//  journal.swift
//  Pandemically
//
//  Created by Ryan Luong on 11/29/20.
//  Copyright © 2020 Ryan Luong. All rights reserved.
//

import Foundation

class Journal: Codable {
    var title: String
    var date: String
    var activities: [String]
    var message: String
    var feeling: String

    init(title: String, date: String, activities: [String], message: String, feeling: String) {
        self.title = title
        self.date = date
        self.activities = activities
        self.message = message
        self.feeling = feeling
    }
}
