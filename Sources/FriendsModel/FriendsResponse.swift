//
//  FriendsResponse.swift
//  
//
//  Created by Ivan Konishchev on 13.12.2022.
//

import Foundation
import RealmSwift

public final class FriendsResponse: Object, Decodable {
    enum CodingKeys: String, CodingKey {
        case items
        case countFriends = "count"
    }
    @objc dynamic public var id = 0
    @objc dynamic public var countFriends = 0
    dynamic public var items = List<FriendsItems>()
    
    convenience public init(from decoder: Decoder) throws {
        self.init()
        let user = decoder.userInfo.first { $0.key.rawValue == "ownerId" }
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try container.decode(List<FriendsItems>.self, forKey: .items)
        countFriends = try container.decode(Int.self, forKey: .countFriends)
        id = user?.value as! Int
    }
    public override class func primaryKey() -> String? {
        return "id"
    }
}
