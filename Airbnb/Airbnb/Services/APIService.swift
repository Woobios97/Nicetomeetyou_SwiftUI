//
//  APIService.swift
//  Airbnb
//
//  Created by 김우섭 on 1/7/24.
//

import Foundation

final class APIService {
    init() {}
    
    struct Constatns {
        static let apiUrl = URL(string: "https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets/airbnb-listings/records?limit=100&lang=en&refine=city%3A%22New+York%22&refine=room_type%3A%22Entire+home%2Fapt%22")
    }
    
    public func getListings(completion: @escaping (Result<[AirbnbListing], Error>) -> Void) {
        guard let url = Constatns.apiUrl else {
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                if let error {
                    completion(.failure(error))
                }
                return
            }
            do {
                let response = try JSONDecoder().decode(AirbnbListingsResponse.self, from: data)
                completion(.success(response.results))
            } catch {
//                let json = try? JSONSerialization.jsonObject(with: data)
//                print(String(describing: json))
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
