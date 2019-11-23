//
//  ClassNameProtocol.swift
//  HackerNews
//
//  Created by Shayan Ali on 23/11/2019.
//  Copyright © 2019 Shayan Ali. All rights reserved.
//

import Foundation

public protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

public extension ClassNameProtocol {
     static var className: String {
        return String(describing: self)
    }

     var className: String {
        return type(of: self).className
    }
}

extension NSObject: ClassNameProtocol {}
