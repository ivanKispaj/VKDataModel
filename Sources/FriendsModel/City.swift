//
//  City.swift
//  
//
//  Created by Ivan Konishchev on 13.12.2022.
//

import Foundation
import RealmSwift

public final class City: Object, Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case title
    }
    
    @objc dynamic public var id: Int = 0
    @objc dynamic public var title: String = ""
    
    convenience public init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
    }
    
}
