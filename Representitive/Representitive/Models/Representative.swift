//
//  Representitive.swift
//  Representitive
//
//  Created by Jordan Lamb on 10/2/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import Foundation

struct Representative: Codable {
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
}
