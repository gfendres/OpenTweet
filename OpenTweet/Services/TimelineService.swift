//
//  TimelineService.swift
//  OpenTweet
//
//  Created by Guilherme Endres on 24.10.22.
//  Copyright © 2022 OpenTable, Inc. All rights reserved.
//

import Foundation

protocol TimelineServing {
    func fetchTimeline() -> [Post]
}

class TimelineService: TimelineServing {
    
    private let fileName: String
    init(fileName: String = "timeline") {
        self.fileName = fileName
    }
    
    private func loadJson(filename fileName: String) -> [Post]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let jsonData = try decoder.decode(ResponseData.self, from: data)
                return jsonData.timeline
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
    func fetchTimeline() -> [Post] {
        loadJson(filename: fileName) ?? []
    }
}
