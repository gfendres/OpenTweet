//
//  TimelineModuleFactory.swift
//  OpenTweet
//
//  Created by Guilherme Endres on 24.10.22.
//  Copyright © 2022 OpenTable, Inc. All rights reserved.
//

import Foundation
import UIKit

class TimelineModuleFactory {
    static func makeModule(in window: UIWindow?) {
        
        window?.makeKeyAndVisible()
        
        let service = TimelineService()
        let eventController = TimelineEventController(service: service)
        let viewController = TimelineViewController(eventController: eventController)
        eventController.view = viewController
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.isTranslucent = true
        window?.rootViewController = navigationController
        
    }
}
