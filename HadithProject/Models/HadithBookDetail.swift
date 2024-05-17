//
//  HadithBookDetail.swift
//  HadithProject
//
//  Created by AMALITECH-PC-593 on 2/21/24.
//

import Foundation


import Foundation

struct HadithBookDetail: Hashable, Codable {
    let id = UUID()
    let bookName: String
   let hadithsCount: String
    let bookSlug: String
    //let bookNameArabic: String
    let chaptersCount: String
    let writerName: String
    let writerDeath: String
    let aboutWriter: String? // Optional as it can be null

    enum CodingKeys: String, CodingKey {
        case id
        case bookName = "bookName"
       case hadithsCount = "hadiths_count"
        case bookSlug = "bookSlug"
       // case bookNameArabic = "bookNameArabic"
        case chaptersCount = "chapters_count"
        case writerName = "writerName"
        case writerDeath = "writerDeath"
        case aboutWriter = "aboutWriter"
    }
}
