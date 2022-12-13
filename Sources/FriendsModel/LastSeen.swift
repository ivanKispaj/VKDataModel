//
//  LastSeen.swift
//  
//
//  Created by Ivan Konishchev on 13.12.2022.
//

import Foundation
import RealmSwift

public final class LastSeen: Object, Decodable {
    enum CodingKeys: String, CodingKey {
        case time
        case platform
    }
    @objc dynamic public var platform: Int = 0
    @objc dynamic public var time: Double = 0
    
    convenience public init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        time = try container.decode(Double.self, forKey: .time)
        platform = try container.decode(Int.self, forKey: .platform)
    }
    
}
