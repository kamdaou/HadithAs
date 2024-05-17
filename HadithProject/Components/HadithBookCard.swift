//
//  BookCard.swift
//  HadithProject
//
//  Created by AMALITECH-PC-593 on 2/21/24.
//

import SwiftUI

struct HadithBookCard: View, Hashable{
    let id = UUID()
    let bookName: String
    let bookNameArabic: String
    let numOfBooks: Int
    let h = UIScreen.main.bounds.width * 0.4
    var nameInitial: Character {
        bookName.split(separator: " ")
            .last?.first ?? Character("")
    }
   
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .frame(width: h,height: h)
                .foregroundColor(AppColors.primary)
                .shadow(radius: 4)
            VStack(spacing: 10) {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: h * 0.25,height: h * 0.25)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .overlay(Text("\(String(nameInitial))")
                        .foregroundColor(AppColors.secondaryText))
                
                Text(bookName)
                    .labelTextStyle()
                Text(bookNameArabic)
                    .labelTextStyle()
                HStack {
                    Image(systemName: "align.vertical.bottom")
                        .font(.system(size: 12))
                        
                    Text("\(numOfBooks) Ahadith")
                }.labelTextStyle()
            }
            
        }
    }
}

#Preview {
    HadithBookCard(bookName: "Sahih Bukhari", bookNameArabic: " صحيح البخاري", numOfBooks: 4324)
}



