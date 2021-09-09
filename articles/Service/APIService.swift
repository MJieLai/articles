//
//  APIService.swift
//  articles
//
//  Created by Hexa-MingJie.Lai on 08/09/2021.
//

import Foundation
import UIKit

class APIService :  NSObject {
        
    //MARK: - Constant
    private let apiKey = "X1paOooAaYxUVFEQEyx6uKc6wHCJMBRX"
    private let commonUrlHeader = "https://api.nytimes.com/svc/"
    
    //MARK: - Popular Article API
    func apiToGetPopularArticle(type: String, completion : @escaping (Articles?, Error?) -> Void) {
        let sourcesURL = URL(string: "\(commonUrlHeader)mostpopular/v2/\(type)/7.json?api-key=\(apiKey)")!
            
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let empData =  try jsonDecoder.decode(Articles.self, from: data)
                    completion(empData, nil)
                } catch {
                    // Catch the error and handle it.
                    completion(nil, error)
                }
            }
        }.resume()
    }
    
    //MARK: - Search Article API
    func apiToSearchArticle(searchText: String, completion : @escaping (ArticleSearch?, Error?) -> Void) {
        let sourcesURL = URL(string: "\(commonUrlHeader)search/v2/articlesearch.json?q=\(searchText)&api-key=\(apiKey)")!
        
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let empData =  try jsonDecoder.decode(ArticleSearch.self, from: data)
                    completion(empData, nil)
                } catch {
                    // Catch the error and handle it.
                    completion(nil, error)
                }
            }
        }.resume()
    }
}
