//
//  ArticleModel.swift
//  articles
//
//  Created by Hexa-MingJie.Lai on 08/09/2021.
//

import Foundation

struct Articles: Decodable {
    let results: [ArticleData]
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
    
    init(results: [ArticleData]) {
        self.results = results
    }
}

struct ArticleData: Decodable {
    let published_date: String?
    let title: String?
    
    init(title: String, published_date: String) {
        self.title = title
        self.published_date = published_date
    }
}


