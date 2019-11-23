//
//  Providers.swift
//  HackerNews
//
//  Created by Shayan Ali on 23/11/2019.
//  Copyright © 2019 Shayan Ali. All rights reserved.
//

import Foundation
import Moya

struct Providers {
    static let storyProvider = MoyaProvider<StoryService>(manager: RequestManager.manager())
}
