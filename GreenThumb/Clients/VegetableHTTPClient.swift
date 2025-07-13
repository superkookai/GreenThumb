//
//  VegetableHTTPClient.swift
//  GreenThumb
//
//  Created by Weerawut Chaiyasomboon on 13/07/2568.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
}

struct VegetableHTTPClient {
    
    @MainActor
    func fetchVegetables() async throws -> [Vegetable] {
        guard let url = URL(string: "https://azamsharp.com/vegetables.json") else {
            throw APIError.invalidURL
        }
        let request = URLRequest(url: url)
        
        do {
            let (data,_) = try await URLSession.shared.data(for: request)
            let decodedVegetables = try JSONDecoder().decode([Vegetable].self, from: data)
            return decodedVegetables
        } catch {
            throw APIError.invalidResponse
        }
    }
}

