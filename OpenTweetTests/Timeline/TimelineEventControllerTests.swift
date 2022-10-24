//
//  TimelineEventControllerTests.swift
//  OpenTweetTests
//
//  Created by Guilherme Endres on 24.10.22.
//  Copyright © 2022 OpenTable, Inc. All rights reserved.
//

import XCTest
@testable import OpenTweet

final class MockTimelineService: TimelineServing {
    static func date() -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "DD MM YY"
        return formatter.date(from: "20 10 21")!
    }
    var fetchTimelineStub = [
        Post(
            id: "1",
            author: "foo",
            avatar: nil,
            content: "bar",
            inReplyTo: nil,
            date: date()
        )
    ]
    func fetchTimeline() -> [OpenTweet.Post] {
        fetchTimelineStub
    }
}

final class MockTimelineView: TimelineViewing {
    
    var showTimelineSpy: [Post]?
    func show(timeline: [Post]) {
        showTimelineSpy = timeline
    }
}

final class TimelineEventControllerTests: XCTestCase {
    
    private var subject: TimelineEventController!
    private var mockView: MockTimelineView!
    private var mockService: MockTimelineService!
    
    override func setUp() {
        super.setUp()
        mockService = MockTimelineService()
        subject = TimelineEventController(service: MockTimelineService())
        mockView = MockTimelineView()
        subject.view = mockView
    }
    
    override func tearDown() {
        subject = nil
        mockView = nil
        mockService = nil
        super.tearDown()
    }
    
    func test_viewDidLoad_showsTimeline() {
        subject.viewDidLoad()
        
        XCTAssertEqual(mockService.fetchTimelineStub, mockView.showTimelineSpy)
    }
}
