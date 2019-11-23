//
//  Extension+Double.swift
//  HackerNews
//
//  Created by Shayan Ali on 23/11/2019.
//  Copyright © 2019 Shayan Ali. All rights reserved.
//

import Foundation

extension Int {
    func getDateStringFromUTC() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateStyle = .medium
        
        return dateFormatter.string(from: date)
    }
}
