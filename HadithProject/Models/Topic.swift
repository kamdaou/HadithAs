//
//  Topic.swift
//  HadithProject
//
//  Created by AMALITECH-PC-593 on 5/17/24.
//

// Define the Topic struct
struct Topic: Decodable, Identifiable, Hashable {
    let id: Int
    let chapterNumber: String
    let chapterEnglish: String
    let chapterUrdu: String
    let chapterArabic: String
    let bookSlug: String

    // Custom CodingKeys to match the JSON keys
    enum CodingKeys: String, CodingKey {
        case id
        case chapterNumber = "chapterNumber"
        case chapterEnglish = "chapterEnglish"
        case chapterUrdu = "chapterUrdu"
        case chapterArabic = "chapterArabic"
        case bookSlug = "bookSlug"
    }
}
