//
//  VegetableListScreen.swift
//  GreenThumb
//
//  Created by Weerawut Chaiyasomboon on 13/07/2568.
//

import SwiftUI

struct VegetableListScreen: View {
    @State private var vegetables: [Vegetable] = []
    
    var body: some View {
        List(vegetables) { vegetable in
            NavigationLink {
                VegetableDetailScreen(vegetable: vegetable)
            } label: {
                VegetableCellView(vegetable: vegetable)
            }
        }
        .listStyle(.plain)
        .task {
            do {
                let client = VegetableHTTPClient()
                self.vegetables = try await client.fetchVegetables()
            } catch {
                print(error.localizedDescription)
            }
        }
        .navigationTitle("Vegetables")
    }
}

#Preview {
    NavigationStack {
        VegetableListScreen()
    }
}
