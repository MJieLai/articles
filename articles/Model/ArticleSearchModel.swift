//
//  ArticleSearchModel.swift
//  articles
//
//  Created by Hexa-MingJie.Lai on 08/09/2021.
//

import Foundation

struct ArticleSearch: Decodable {
    let status: String?
    let responseData: ArticleSearchResponse
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case responseData = "response"
    }
}

struct ArticleSearchResponse: Decodable {
    let docs: [ArticleSearchData]
    
    enum CodingKeys: String, CodingKey {
        case docs = "docs"
    }
}

struct ArticleSearchData: Decodable {
    let published_date: String
    let headline: HeadlineData
    
    enum CodingKeys: String, CodingKey {
        case published_date = "pub_date"
        case headline = "headline"
    }
}

struct HeadlineData: Decodable {
    let main: String
    
    enum CodingKeys: String, CodingKey {
        case main = "main"
    }
}
