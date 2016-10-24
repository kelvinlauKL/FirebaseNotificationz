//
//  PostCell.swift
//  FirebaseNotificationz
//
//  Created by Kelvin Lau on 2016-10-23.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//

import UIKit

protocol PostCellDelegate: class {
  func likeButtonTapped()
}

final class PostCell: UITableViewCell {
  static let reuseIdentifier = "\(PostCell.self)"
  
  @IBOutlet private var postDetailsLabel: UILabel!
  @IBOutlet private var usernameLabel: UILabel!
  
  
  weak var delegate: PostCellDelegate?
  
  var post: Post! { didSet {
    postDetailsLabel.text = post.details
    
    Server.loadProfile(withIdentifier: post.userId) { profile in
      self.usernameLabel.text = profile?.name
    }
  }}
}

// MARK: - @IBActions
private extension PostCell {
  @IBAction func likeButtonTapped() {
    delegate?.likeButtonTapped()
  }
}
