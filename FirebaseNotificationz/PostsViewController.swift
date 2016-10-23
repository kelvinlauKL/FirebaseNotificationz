//
//  PostsViewController.swift
//  FirebaseNotificationz
//
//  Created by Kelvin Lau on 2016-10-23.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//

import UIKit

final class PostsViewController: UIViewController {
  @IBOutlet private var tableView: UITableView!
}

// MARK: - UITableViewDataSource
extension PostsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.reuseIdentifier) else { fatalError() }
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
}
