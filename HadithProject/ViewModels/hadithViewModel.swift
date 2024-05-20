//
//  hadithViewModel.swift
//  HadithProject
//
//  Created by AMALITECH-PC-593 on 5/17/24.
//

import Foundation

class HadithViewModel: ObservableObject {
    
    let repository = Repository()
   // @Published var sections: [SectionDetails] = []
    @Published var booksData : [HadithBookDetail] = []
    @Published var isLoading = false
    //@Published var topics: [Topic] = []
       @Published var loadingInfo = ""
       @Published var error: Error? = nil

    func fetchBook(bookSlug: BookSlug) {
            isLoading = true
        print("starting")
        loadingInfo = "Checking for \(bookSlug.rawValue)"
        repository.fetchOrLoadBook(bookSlug: bookSlug){ [self] result in
            loadingInfo = "fetching from database \(bookSlug.rawValue)"
            DispatchQueue.main.async { [self] in
                    self.isLoading = false
                    switch result {
                    case .success(let response):
                        print("success full")
                       // sections = Array(response.sectionDetails.values)
                        booksData = booksData + [response]
                       
                    case .failure(let error):
                        print("failded \(error.localizedDescription)")
                        self.error = error
                    }
                }
            }
        }

    
}

enum BookSlug : String {
    case ArabicBukhari = "ara-bukhari.json"
    case EnglishBukhari = "eng-bukhari.json"
}
