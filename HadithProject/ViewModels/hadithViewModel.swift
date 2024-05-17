//
//  hadithViewModel.swift
//  HadithProject
//
//  Created by AMALITECH-PC-593 on 5/17/24.
//

import Foundation

class HadithViewModel: ObservableObject {
    let repository = Repository()
    @Published var bookDetails: [HadithBookDetail] = []
    @Published var topics: [Topic] = []
       @Published var isLoading = false
       @Published var error: NetworkError?

    func fetchBooks() {
            isLoading = true
            error = nil

        repository.getBooks { result in
                DispatchQueue.main.async {
                    self.isLoading = false
                    switch result {
                    case .success(let response):
                        self.bookDetails = response.books
                    case .failure(let error):
                        self.error = error
                    }
                }
            }
        }

    func fetchTopics() {
            isLoading = true
            error = nil

        repository.getTopics { result in
                DispatchQueue.main.async {
                    print("results is \(result)")
                    self.isLoading = false
                    switch result {
                    case .success(let response):
                        self.topics = response.chapters
                    case .failure(let error):
                        self.error = error
                    }
                }
            }
        }
}
