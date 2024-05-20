//
//  HomeView.swift
//  HadithProject
//
//  Created by AMALITECH-PC-593 on 2/21/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var hadithViewModel = HadithViewModel()
    var isLoading: Bool {
        hadithViewModel.isLoading
    }
    var loadingInfo: String {
        hadithViewModel.loadingInfo
    }
    var books: [HadithBookDetail]{
        hadithViewModel.booksData
    }


    var body: some View {
        NavigationView{
            ScrollView {
                if isLoading {
                    VStack {
                        ProgressView()
                            .position(x:UIScreen.main.bounds.width/2,y:UIScreen.main.bounds.height/2.5)
                        Text(loadingInfo)
                            .bold()
                            .font(.title)
                            .position(x:UIScreen.main.bounds.width/2,y:UIScreen.main.bounds.height/2.5)
                            .padding()

                    }
                }else {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 16)], spacing: 16) {
                    Section(header: Text("All Books \(books.count)")
                        .labelTextStyle()
                            
                    )
                    {
                        ForEach(books, id: \.self) { book in
                            NavigationLink(destination: HadithTopicsViews(sections: Array(book.metadata.sections.values), title: book.metadata.name)) {
                                HadithBookCard(bookName: book.metadata.name, bookNameArabic: "arabic Name", numOfBooks: book.metadata.sections.count)
                            }.foregroundColor(AppColors.primaryText)
                        }
                        
                        
                    }
                }
                .padding()
            }
            }
            .onAppear{
                hadithViewModel.fetchBook(bookSlug: .ArabicBukhari)
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
