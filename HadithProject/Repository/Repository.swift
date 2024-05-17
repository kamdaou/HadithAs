//
//  Repository.swift
//  HadithProject
//
//  Created by AMALITECH-PC-593 on 2/21/24.
//

import Foundation


class Repository {
    let apiKey = "$2y$10$JiseuxpG4K6Z2Jy8K0INWMNaN3fXJlgnsSL63GmlUyUngpMXba"
    let baseUri = "https://www.hadithapi.com/api/"
    
    
    func getBooks(completion: @escaping (Result<BookResponse, NetworkError>) -> Void) {
        guard let url = URL(string: "\(baseUri)books?apiKey=\(apiKey)") else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.decodingError(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data)
                let bookDetails = try JSONDecoder().decode(BookResponse.self, from: data)
                completion(.success(bookDetails))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }
        
        task.resume()
    }
    
    func getTopics(completion: @escaping (Result<ChapterResponse, NetworkError>) -> Void) {
        guard let url = URL(string: "\(baseUri)chapters?apiKey=\(apiKey)") else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.decodingError(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data)
                print("data repo \(json)")
                let bookDetails = try JSONDecoder().decode(ChapterResponse.self, from: data)
                completion(.success(bookDetails))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }
        
        task.resume()
    }
}


struct BookResponse: Codable {
    let status: Int 
    let message: String
    let books: [HadithBookDetail]
}

struct ChapterResponse: Decodable {
    let status: Int
    let message: String
    let chapters: [Topic]
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError(Error)
}
