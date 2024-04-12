//
//  Result.swift
//  BucketList_3
//
//  Created by David Stanton on 4/11/24.
//
// ==== Result ====
// three codable Structs
// Result that has a query: Query
// Query that has pages: [Int: Page]
// Page that is Comparable and has pageId: Int, title: String, terms: [String: [String]]?
// var description that returns terms?["description"]?.first if it exists, or pro forma text
// sorting function that sorts by title
import Foundation

struct Result: Codable {
    var query: Query
}

struct Query: Codable {
    var pages: [Int: Page]
}

struct Page: Codable, Comparable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
    var description: String {
        terms?["description"]?.first ?? "No further information"
    }
    
    static func <(lhs: Page, rhs: Page) -> Bool {
        lhs.title < rhs.title
    }
}
