//
//  VegetableListScreen.swift
//  GreenThumb
//
//  Created by Weerawut Chaiyasomboon on 13/07/2568.
//

import SwiftUI

struct VegetableListScreen: View {
    let vegetables: [Vegetable]
    
    @State private var searchText: String = ""
    
    private var filteredVegetables: [Vegetable] {
        if searchText.isEmpty {
            return vegetables
        } else {
            return vegetables.filter({ $0.name.localizedCaseInsensitiveContains(searchText)})
        }
    }
    
    var body: some View {
        List(filteredVegetables) { vegetable in
            NavigationLink {
                VegetableDetailScreen(vegetable: vegetable)
            } label: {
                VegetableCellView(vegetable: vegetable)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Vegetables")
        .searchable(text: $searchText)
    }
}

#Preview {
    NavigationStack {
        VegetableListScreen(vegetables: PreviewData.loadVegetables())
    }
}
