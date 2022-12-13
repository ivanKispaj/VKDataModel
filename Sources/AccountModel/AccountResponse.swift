//
//  AccountResponse.swift
//  
//
//  Created by Ivan Konishchev on 13.12.2022.
//

import Foundation
import RealmSwift

public final class AccountResponse: Object, Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case avatar = "photo_50"
        case fName = "first_name"
        case lName = "last_name"
        case status
        case screenName = "screen_name"
    }
    
    @objc dynamic public var id: Int = 0
    @objc dynamic public var nickname: String = ""
    @objc dynamic public var avatar: String = ""
    @objc dynamic public var fullName: String = ""
    @objc dynamic public var status: String = ""
    @objc dynamic public var screenName: String = ""
    
    convenience public init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.avatar = try container.decode(String.self, forKey: .avatar)
        let fName = try container.decode(String.self, forKey: .fName)
        let lname = try container.decode(String.self, forKey: .lName)
        self.fullName = fName + " " + lname
        self.status = try container.decode(String.self, forKey: .status)
        self.screenName = try container.decode(String.self, forKey: .screenName)
    }
}
