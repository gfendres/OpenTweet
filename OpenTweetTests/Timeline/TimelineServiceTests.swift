//
//  TimelineServiceTests.swift
//  OpenTweetTests
//
//  Created by Guilherme Endres on 24.10.22.
//  Copyright © 2022 OpenTable, Inc. All rights reserved.
//

import XCTest
@testable import OpenTweet

class TimelineServiceTests: XCTestCase {
    
    private var subject: TimelineService!
    override func setUp() {
        super.setUp()
        // Ideally we would set a new file for testing here, but for simplicity lets keep the same.
        subject = TimelineService()
    }
    
    override func tearDown() {
        subject = nil
        super.tearDown()
    }
    
    func test_fetchTimeline_loadsFile() {
        XCTAssertTrue(subject.fetchTimeline().count == 7)
    }
    
    func test_fetchTimeline_decodesTheDate() {
        let date = try? Date("2020-09-29T14:41:00-08:00", strategy: .iso8601)
        XCTAssertTrue(subject.fetchTimeline()[0].date == date)
        
        let secondDate = try? Date("2020-09-30T09:41:00-08:00", strategy: .iso8601)
        XCTAssertTrue(subject.fetchTimeline()[1].date == secondDate)
    }
    
    func test_fetchTimeline_decodesTheAvatar() {
        XCTAssertTrue(subject.fetchTimeline()[0].avatar?.absoluteString == "https://i.imgflip.com/ohrrn.jpg")
        XCTAssertTrue(subject.fetchTimeline()[1].avatar?.absoluteString == "https://avatars1.githubusercontent.com/u/536608?v=3&s=460")
    }
    
}
