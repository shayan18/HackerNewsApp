//
//  StoryViewModel.swift
//  HackerNews
//
//  Created by Shayan Ali on 23/11/2019.
//  Copyright © 2019 Shayan Ali. All rights reserved.
//

import Foundation
struct StoryViewModel {
    
    let by: String
    let score: Int
    let title, time: String
    let url: String?
    
    //Dependency Injection
    init(story: Story) {
        self.by = story.by ?? "N/A"
        self.score = story.score ?? 0
        self.time = story.time?.getDateStringFromUTC() ?? ""
        self.title = story.title ?? "N/A"
        self.url = story.url
    }
}
