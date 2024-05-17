//
//  MainView.swift
//  HadithProject
//
//  Created by AMALITECH-PC-593 on 2/21/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
               
                .tabItem {
                    Image(systemName: "home")
                    Text("Home")
                    
                }
            Text("Search")
                .tabItem {
                    Image(systemName: "search")
                    Text("Search")
                }
        }
      
    }
}

#Preview {
    MainView()
}
