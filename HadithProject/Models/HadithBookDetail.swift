//
//  HadithBookDetail.swift
//  HadithProject
//
//  Created by AMALITECH-PC-593 on 2/21/24.
//

import Foundation


import Foundation

struct HadithBookDetail: Codable, Hashable {
    let metadata: Metadata
    let sectionDetails: [String: [String: Int]]
   // let hadiths: [Hadith]

    enum CodingKeys: String, CodingKey {
        case metadata = "metadata"
        case sectionDetails = "section_details"
//        case hadiths = "hadiths"
    }
}

struct Metadata: Codable, Hashable {
    let name: String
    let sections: [String: String]

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case sections = "sections"
    }
}

struct SectionDetails: Codable, Hashable {
    let hadithnumberFirst: Double  // Changed from Int
    let hadithnumberLast: Double  // Changed from Int
    let arabicnumberFirst: Double // Changed from Int
    let arabicnumberLast: Double // Changed from Int

    // ... other properties

    enum CodingKeys: String, CodingKey {
        case hadithnumberFirst = "hadithnumber_first"
        case hadithnumberLast = "hadithnumber_last"
        case arabicnumberFirst = "arabicnumber_first"
        case arabicnumberLast = "arabicnumber_last"
    }
}

struct Hadith: Codable, Hashable {
    let hadithnumber: Int
    let arabicnumber: Int
    let text: String
    let grades: [String]
    let reference: Reference

    enum CodingKeys: String, CodingKey {
        case hadithnumber = "hadithnumber"
        case arabicnumber = "arabicnumber"
        case text = "text"
        case grades = "grades"
        case reference = "reference"
    }
}

struct Reference: Codable, Hashable {
    let book: Int
    let hadith: Int

    enum CodingKeys: String, CodingKey {
        case book = "book"
        case hadith = "hadith"
    }
}
