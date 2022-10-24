//
//  TimelinePresenter.swift
//  OpenTweet
//
//  Created by Guilherme Endres on 24.10.22.
//  Copyright © 2022 OpenTable, Inc. All rights reserved.
//

import Foundation

protocol TimelineEventControlling {
    func viewDidLoad()
}

protocol TimelineViewing: AnyObject {
    func show(timeline: [Post])
}

class TimelineEventController: TimelineEventControlling {
    
    private let service: TimelineServing
    weak var view: TimelineViewing?
    
    init(service: TimelineServing) {
        self.service = service
    }
    
    func viewDidLoad() {
        view?.show(timeline: service.fetchTimeline())
    }
}
