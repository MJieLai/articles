//
//  ArticleTests.swift
//  articlesTests
//
//  Created by Hexa-MingJie.Lai on 09/09/2021.
//

import XCTest
@testable import articles

class ArticleTests: XCTestCase {
    
    var sut: ArticleViewController!
        
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        sut = storyboard.instantiateViewController(withIdentifier: "ArticleViewController") as? ArticleViewController
            
        sut.loadViewIfNeeded()
    }
        
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testOutletsAreConnected() throws {
        _ = try XCTUnwrap(sut.listView, "The Articles Tableview is not connected")
    }
}
