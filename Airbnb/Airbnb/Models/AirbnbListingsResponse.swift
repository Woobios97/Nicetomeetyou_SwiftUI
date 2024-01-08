//
//  AirbnbListingsResponse.swift
//  Airbnb
//
//  Created by 김우섭 on 1/7/24.
//

import Foundation

struct AirbnbListingsResponse: Codable {
    let total_count: Int
    let results: [AirbnbListing]
}
