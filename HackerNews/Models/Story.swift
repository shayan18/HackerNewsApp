//
//  Story.swift
//  HackerNews
//
//  Created by Shayan Ali on 23/11/2019.
//  Copyright © 2019 Shayan Ali. All rights reserved.
//

import Foundation
 
// MARK: - Story
struct Story: Codable {
    let by: String?
    let descendants, id: Int?
    let kids: [Int]?
    let score, time: Int?
    let title, type: String?
    let url: String?
}
