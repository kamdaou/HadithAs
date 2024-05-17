//
//  HadithTopicTile.swift
//  HadithProject
//
//  Created by AMALITECH-PC-593 on 2/21/24.
//

import SwiftUI

struct HadithTopicTile: View {
    let topic: Topic
    var body: some View {
        HStack{
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 40,height: 40)
                .foregroundColor(AppColors.grey.opacity(0.6))
                .overlay(Text("\(topic.id)"))
                .padding()
            VStack (alignment: .leading){
                Text(topic.chapterEnglish)
                    .bold()
                Text("Hadith No: \(topic.chapterArabic) ")
            }
            
        }.frame(width: UIScreen.main.bounds.width,  height: 70, alignment: .leading)
            
    }
}

#Preview {
    HadithTopicTile(topic: Topic(id: 1, chapterNumber: "1", chapterEnglish: "Revelation", chapterUrdu: "وحی کے بیان میں", chapterArabic: "كتاب بدء الوحى", bookSlug: "sahih-bukhari"))
}
