//
//  ArticleViewModel.swift
//  articles
//
//  Created by Hexa-MingJie.Lai on 08/09/2021.
//

import Foundation
import UIKit

class ArticleViewModel : NSObject {
    
    private var apiService : APIService!
    private(set) var articleData : [ArticleData] = [] {
        didSet {
            self.bindArticleViewModelToController()
        }
    }
    
    var bindArticleViewModelToController : (() -> ()) = {}
    var apiError: String = ""
    
    //MARK: - Initialisation
    override init() {
        super.init()
        self.apiService = APIService()
    }
    
    //MARK: - API functions
    func callFuncToGetArticleData(articleType: String) {
        self.apiService.apiToGetPopularArticle(type: articleType) { (data, error)  in
            if let data = data {
                self.articleData = data.results
            }
            else {
                self.articleData = []
                self.apiError = error?.localizedDescription ?? "No data found"
            }
        }
    }
    
    func callFuncToSearchArticleData(searchText: String) {
        var articles = [ArticleData]()
        
        self.apiService.apiToSearchArticle(searchText: searchText) { (data, error) in
            if let data = data {
                for article in data.responseData.docs {
                    let arData = ArticleData(title: article.headline.main, published_date: self.serverToLocal(date: article.published_date) )
                    articles.append(arData)
                }
                self.articleData = articles
            }
            else {
                self.articleData = []
                self.apiError = error?.localizedDescription ?? "No data found"
            }
        }
    }
    
    //MARK: - Helper
    func serverToLocal(date:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        let localDate = dateFormatter.date(from: date)!

        let dateString = DateFormatter.localizedString(
            from: localDate,
            dateStyle: .medium,
            timeStyle: .medium)
        
        return dateString
    }
}
