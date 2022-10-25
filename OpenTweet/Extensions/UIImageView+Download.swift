//
//  UIImageView+Download.swift
//  OpenTweet
//
//  Created by Guilherme Endres on 25.10.22.
//  Copyright © 2022 OpenTable, Inc. All rights reserved.
//

import UIKit

extension UIImageView {
    func download(image url: URL) {
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else {
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
    }
}
