//
//  HomeView.swift
//  HadithProject
//
//  Created by AMALITECH-PC-593 on 2/21/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var hadithViewModel = HadithViewModel()
    
    var books: [HadithBookDetail]{
        hadithViewModel.bookDetails
    }


    var body: some View {
        NavigationView{
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 16)], spacing: 16) {
                    Section(header: Text("All Books \(books.count)")
                     .labelTextStyle()

                    )
                    {
                        ForEach(books, id: \.self) { book in
                            
                            NavigationLink(destination: HadithTopicsViews(topics: hadithViewModel.topics, title: book.bookName)) {
                                HadithBookCard(bookName: book.bookName, bookNameArabic: book.bookSlug, numOfBooks: Int(book.hadithsCount) ?? 0)
                            }.foregroundColor(AppColors.primaryText)
                        }
                    
                    
                    }
                }
                .padding()
            }
            .onAppear{
                hadithViewModel.fetchBooks()
                hadithViewModel.fetchTopics()
            }
            .background(AppColors.grey.opacity(0.2))
            .navigationTitle("Hadith Collection")
            .navigationBarItems(leading: Image(systemName: "car"))
        }
       }
}

#Preview {
    HomeView()
}
