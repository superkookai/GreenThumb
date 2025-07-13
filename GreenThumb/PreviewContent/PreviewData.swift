//
//  PreviewData.swift
//  GreenThumb
//
//  Created by Weerawut Chaiyasomboon on 13/07/2568.
//

import Foundation

struct PreviewData {
    static func loadVegetables() -> [Vegetable] {
        let url = Bundle.main.url(forResource: "vegetables", withExtension: "json")!
        do {
            let data = try Data(contentsOf: url)
            let decodedVegetables = try JSONDecoder().decode([Vegetable].self, from: data)
            return decodedVegetables
        } catch {
            fatalError("ERROR Fetching Vegetables from JSON file")
        }
    }
}
