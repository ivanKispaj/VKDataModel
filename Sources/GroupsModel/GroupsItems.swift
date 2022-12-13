//
//  GroupsItems.swift
//  
//
//  Created by Ivan Konishchev on 13.12.2022.
//

import Foundation
import RealmSwift

public final class GroupsItems: Object, Decodable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case activity = "activity"
        case id
        case groupName = "name"
        case isClosed = "is_closed"
        case photoGroup = "photo_50"
    }
    @objc dynamic public var activity: String? = nil
    @objc dynamic public var id: Int = 0
    @objc dynamic public var groupName: String = ""
    @objc dynamic public var isClosed: Int = 0
    @objc dynamic public var photoGroup: Data!
    
    convenience public init(from decoder: Decoder) throws {
        self.init()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        activity = try container.decodeIfPresent(String.self, forKey: .activity) ?? nil
        id = try container.decode(Int.self, forKey: .id)
        groupName = try container.decode(String.self, forKey: .groupName)
        isClosed = try container.decode(Int.self, forKey: .isClosed)
        let url = try container.decode(String.self, forKey: .photoGroup)
        photoGroup =  try? Data(contentsOf: URL(string: url)!)
    }
    public override class func primaryKey() -> String? {
        return "id"
    }
}

