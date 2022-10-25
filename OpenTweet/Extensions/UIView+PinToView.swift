//
//  UIView+PinToView.swift
//  OpenTweet
//
//  Created by Guilherme Endres on 25.10.22.
//  Copyright © 2022 OpenTable, Inc. All rights reserved.
//

import UIKit

extension UIView {
    func pinEdges(to other: UIView) {
        leadingAnchor.constraint(equalTo: other.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: other.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: other.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: other.bottomAnchor).isActive = true
    }
}
