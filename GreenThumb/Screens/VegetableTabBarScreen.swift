//
//  VegetableTabBarScreen.swift
//  GreenThumb
//
//  Created by Weerawut Chaiyasomboon on 13/07/2568.
//

import SwiftUI

struct VegetableTabBarScreen: View {
    var body: some View {
        TabView {
            NavigationStack {
                VegetableListScreen()
            }
            .tabItem {
                Label("Vegetables", systemImage: "leaf")
            }
            
            NavigationStack{
                Text("My Garden Screen")
            }
            .tabItem {
                Label("My Garden", systemImage: "house")
            }
            
            NavigationStack {
                Text("Pests")
            }
            .tabItem {
                Label("Pests", systemImage: "ladybug")
            }
        }
    }
}

#Preview {
    VegetableTabBarScreen()
}
