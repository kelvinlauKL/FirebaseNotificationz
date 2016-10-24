//
//  User.swift
//  FirebaseNotificationz
//
//  Created by Kelvin Lau on 2016-10-23.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//

struct User {
  var uid: String
  var name: String
  var postIds: [String]
  
  init(uid: String = Server.generateRandomId(), name: String, postIds: [String] = []) {
    self.uid = uid
    self.name = name
    self.postIds = postIds
  }
}

// MARK: - Mutating Methods
extension User {
  mutating func add(post: Post) {
    postIds.append(post.uid)
  }
}

// MARK: - FirebaseConvertible
extension User: FirebaseConvertible {
  var json: [String: Any] {
    return [
      "uid": uid,
      "name": name,
      "postIds": postIds
    ]
  }
  
  init(dictionary: [String: Any]) {
    guard let uid = dictionary["uid"] as? String else { fatalError() }
    self.uid = uid
    
    guard let name = dictionary["name"] as? String else { fatalError() }
    self.name = name
    
    guard let postIds = dictionary["groupIds"] as? [String] else {
      self.postIds = []
      return
    }
    self.postIds = postIds
  }
}

extension User: Equatable {}

func ==(lhs: User, rhs: User) -> Bool {
  return lhs.uid == rhs.uid
}
