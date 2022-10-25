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
    private let tableView: UITableView
    private var timeline: [Post] = []
    private let cellIdentifier = "postCell"
    
    // MARK: - Init
    
    init(eventController: TimelineEventControlling) {
        self.eventController = eventController
        tableView = UITableView(frame: .zero)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View lifecycle
    
	override func viewDidLoad() {
		super.viewDidLoad()
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PostCell.self, forCellReuseIdentifier: cellIdentifier)
        view.addSubview(tableView)
        tableView.pinEdges(to: view)
        
        eventController.viewDidLoad()
	}
}

extension TimelineViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeline.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier,
            for: indexPath
        ) as! PostCell
        
        let post = timeline[indexPath.row]
        
        cell.authorLabel.text = post.author
        if let avatar = post.avatar {
            cell.avatarImageView.download(image: avatar)
        }
        cell.dateLabel.text = post.date.formatted()
        cell.contentLabel.text = post.content
        
        return cell
    }
}

extension TimelineViewController: TimelineViewing {
    func show(timeline: [Post]) {
        self.timeline = timeline
        tableView.reloadData()
    }
}
