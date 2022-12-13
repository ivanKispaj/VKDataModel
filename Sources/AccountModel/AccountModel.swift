//
//  File.swift
//  
//
//  Created by Ivan Konishchev on 13.12.2022.
//

import Foundation
import RealmSwift

public final class AccountModel: Decodable {
    public var response = List<AccountResponse>()
}
