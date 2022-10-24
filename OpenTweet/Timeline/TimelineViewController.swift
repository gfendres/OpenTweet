//
//  ViewController.swift
//  OpenTweet
//
//  Created by Olivier Larivain on 9/30/16.
//  Copyright © 2016 OpenTable, Inc. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

    private let eventController: TimelineEventControlling
    
    // MARK: - Init
    
    init(eventController: TimelineEventControlling) {
        self.eventController = eventController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View lifecycle
    
	override func viewDidLoad() {
		super.viewDidLoad()
        view.backgroundColor = UIColor.red
        eventController.viewDidLoad()
	}
}

extension TimelineViewController: TimelineViewing {
    func show(timeline: [Post]) {
        print(timeline)
    }
}
