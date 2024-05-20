//
//  HadithTopicsViews.swift
//  HadithProject
//
//  Created by AMALITECH-PC-593 on 2/21/24.
//

import SwiftUI

struct HadithTopicsViews: View {
    init(sections: [String], title: String) {
           // Set up the appearance for the navigation bar
           let appearance = UINavigationBarAppearance()
           appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(AppColors.grey)
           UINavigationBar.appearance().standardAppearance = appearance
           UINavigationBar.appearance().scrollEdgeAppearance = appearance
        self.sections = sections
        self.title = title
       }
    
    
    var sections: [String]
    var title: String
    
    var body: some View {
        NavigationView {
            ScrollView{
                LazyVGrid(columns: /*@START_MENU_TOKEN@*/[GridItem(.fixed(20))]/*@END_MENU_TOKEN@*/, content: {
                    ForEach(sections, id: \.self){ section in
                        VStack{
                            HadithTopicTile(section: section)
                            Divider()
                                .frame(width: UIScreen.main.bounds.width)
                                .background(.gray)
                        }
                        
                    }
                   
                })
               
            }
          
            .navigationBarTitle(Text(title).foregroundColor(.white)
              )
                .navigationBarItems(leading: Image(systemName: "car"))
              
              
        }
    }
}

#Preview {
    HadithTopicsViews(sections: [], title: "sahih bukhari")
}

