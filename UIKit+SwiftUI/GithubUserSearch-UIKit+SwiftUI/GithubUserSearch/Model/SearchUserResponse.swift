//
//  SearchUserResponse.swift
//  GithubUserSearch
//
//  Created by 김우섭 on 2023/12/24.
//

import Foundation

struct SearchUserResponse: Decodable {
    var items: [SearchResult]
}
