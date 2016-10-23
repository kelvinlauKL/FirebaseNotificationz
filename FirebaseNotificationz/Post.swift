//
//  Post.swift
//  FirebaseNotificationz
//
//  Created by Kelvin Lau on 2016-10-23.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//

struct Post {
  var uid: String
  var name: String
  var userId: String
  
  init(uid: String = Server.generateRandomId(), name: String, userId: String) {
    self.uid = uid
    self.name = name
    self.userId = userId
  }
}

extension Post: FirebaseConvertible {
  var json: [String: Any] {
    return [
      "uid": uid,
      "name": name,
      "userId": userId
    ]
  }
  
  init(dictionary: [String: Any]) {
    guard let uid = dictionary["uid"] as? String else { fatalError() }
    self.uid = uid
    
    guard let name = dictionary["name"] as? String else { fatalError() }
    self.name = name
    
    guard let userId = dictionary["userId"] as? String else { fatalError() }
    self.userId = userId
  }
}
