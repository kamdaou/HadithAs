//
//  HadithTopicTile.swift
//  HadithProject
//
//  Created by AMALITECH-PC-593 on 2/21/24.
//

import SwiftUI

struct HadithTopicTile: View {
    let section: String
    var body: some View {
        HStack{
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 40,height: 40)
                .foregroundColor(AppColors.grey.opacity(0.6))
                .overlay(Text("\(section)"))
                .padding()
            VStack (alignment: .leading){
                Text(section)
                    .bold()
                Text("Arabic: \("Arabic") ")
            }
            
        }.frame(width: UIScreen.main.bounds.width,  height: 70, alignment: .leading)
            
    }
}

#Preview {
    HadithTopicTile(section: "hello")
}
