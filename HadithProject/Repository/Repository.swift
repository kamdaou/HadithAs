//
//  Repository.swift
//  HadithProject
//
//  Created by AMALITECH-PC-593 on 2/21/24.
//

import Foundation
import Alamofire

class Repository {
    let apiKey = "$2y$10$JiseuxpG4K6Z2Jy8K0INWMNaN3fXJlgnsSL63GmlUyUngpMXba"
    let baseUri = "https://cdn.jsdelivr.net/gh/fawazahmed0/hadith-api@1/editions/"
    
    // ... (Previous structs)
    
    func fetchOrLoadBook(bookSlug: BookSlug,completion: @escaping (Result<HadithBookDetail, Error>) -> Void) {
        // 1. Check if data exists in app storage (e.g., in Documents directory)
        let fileManager = FileManager.default
        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let filePath = documentsDirectory.appendingPathComponent("bukhariData.json")
        
        if fileManager.fileExists(atPath: filePath.path) {
            // 2. Load data from file if it exists
            do {
                let data = try Data(contentsOf: filePath)
                let decoder = JSONDecoder()
                let bukhariData = try decoder.decode(HadithBookDetail.self, from: data)
                completion(.success(bukhariData))
            } catch {
                completion(.failure(error))
            }
        } else {
            // 3. Fetch data from API if it doesn't exist
            print("fetching data")
            let url = "\(baseUri)\(bookSlug.rawValue)"
            fetchBukhariData(from: url) { result in
                print("result is here \(url)")
                switch result {
                case .success(let bukhariData):
                    // 4. Store data in file for future use
                    print("success")
                    do {
                        let encoder = JSONEncoder()
                        let encodedData = try encoder.encode(bukhariData)
                        try encodedData.write(to: filePath)
                        completion(.success(bukhariData)) // Return the fetched data
                    } catch {
                        
                        completion(.failure(error))
                    }
                case .failure(let error):
                    print("error is here")
                    completion(.failure(error))
                }
            }
        }
        
    }
    
    
    
    private  func fetchBukhariData(from urlString: String, completion: @escaping (Result<HadithBookDetail, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }
        print("I am here")
        
        AF.request(url)
            .responseDecodable(of: HadithBookDetail.self, decoder: JSONDecoder()) { response in
                print("Response: \(String(describing: response))")
                print("Data: \(String(describing: response.data?.base64EncodedString()))")

                switch response.result {
                case .success(let bukhariData):
                    print("data is in")
                    completion(.success(bukhariData))
                case .failure(let error):
                    print("error in alamofire \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
    }
}


enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError(Error)
}
