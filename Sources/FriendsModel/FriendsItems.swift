//
//  FriendsItems.swift
//  
//
//  Created by Ivan Konishchev on 13.12.2022.
//

import Foundation
import RealmSwift

//MARK: - Realm Model
     public final class FriendsItems: Object, Decodable {
          enum CodingKeys: String, CodingKey {
              case city
              case fName = "first_name"
              case lName = "last_name"
              case photo50 = "photo_50"
              case id
              case online
              case lastSeen = "last_seen"
              case isClosedProfile = "is_closed"
              case banned = "deactivated"
              case status
              
          }
          
          @objc dynamic public var photo50: String = ""
          @objc dynamic public var city: City? = nil
          @objc dynamic public var fName: String = ""
          @objc dynamic public var lName: String = ""
          @objc dynamic public var id: Int = 0
          @objc dynamic public var online: Int = 0
          @objc dynamic public var lastSeen: LastSeen? = nil
          @objc dynamic public var isClosedProfile: Bool = false
          @objc dynamic public var banned: String? = nil
          @objc dynamic public var status: String? = nil
          
          convenience public init(from decoder: Decoder) throws {
              self.init()
              
              let container = try decoder.container(keyedBy: CodingKeys.self)

              photo50 =  try container.decode(String.self, forKey: .photo50)
              city = try? container.decodeIfPresent(City.self, forKey: .city)
              fName = try container.decode(String.self, forKey: .fName)
              lName = try container.decode(String.self, forKey: .lName)
              id = try container.decode(Int.self, forKey: .id)
              online = try container.decode(Int.self, forKey: .online)
              lastSeen = try? container.decodeIfPresent(LastSeen.self, forKey: .lastSeen) ??
              nil
              
              isClosedProfile = try container.decodeIfPresent(Bool.self, forKey: .isClosedProfile) ?? false
              banned = try? container.decode(String.self, forKey: .banned)
              status = try? container.decode(String.self, forKey: .status)
          }
          
        public override class func primaryKey() -> String? {
              return "id"
          }
      }
