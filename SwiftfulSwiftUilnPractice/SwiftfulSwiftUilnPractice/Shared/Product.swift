//
//  Product.swift
//  SwiftfulSwiftUilnPractice
//
//  Created by 김우섭 on 9/29/24.
//

import Foundation

struct ProductArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let price, discountPercentage, rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let sku: String
    let weight: Int
    let warrantyInformation, shippingInformation: String
    let minimumOrderQuantity: Int
    let images: [String]
    let thumbnail: String
}
