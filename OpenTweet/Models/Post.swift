//
//  Post.swift
//  OpenTweet
//
//  Created by Guilherme Endres on 25.10.22.
//  Copyright © 2022 OpenTable, Inc. All rights reserved.
//

import Foundation

struct ResponseData: Decodable {
    let timeline: [Post]
}

struct Post : Decodable, Equatable {
    let id: String
    let author: String
    let avatar: URL?
    let content: String
    let inReplyTo: String?
    let date: Date
}
