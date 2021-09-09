//
//  LandingTests.swift
//  articlesTests
//
//  Created by Hexa-MingJie.Lai on 08/09/2021.
//

import XCTest
@testable import articles

class LandingTests: XCTestCase {
    
    var sut: LandingViewController!
    var navigationController: UINavigationController!
        
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
        sut = storyboard.instantiateViewController(withIdentifier: "LandingViewController") as? LandingViewController
            
        sut.loadViewIfNeeded()
        navigationController = UINavigationController(rootViewController: sut)
    }
        
    override func tearDownWithError() throws {
        sut = nil
        navigationController = nil
    }
    
    func testOutletsAreConnected() throws {
        _ = try XCTUnwrap(sut.searchButton, "The Search UIButton is not connected")
        _ = try XCTUnwrap(sut.viewedButton, "The Most Viewed UIButton is not connected")
        _ = try XCTUnwrap(sut.sharedButton, "The Most Shared UIButton is not connected")
        _ = try XCTUnwrap(sut.emailedButton, "The Most Emailed UIButton is not connected")
    }
    
    func testSearchButton_WhenTapped_SearchViewControllerIsPushed() throws {
        let myPredicate = NSPredicate { input, _ in
            return (input as? UINavigationController)?.topViewController is SearchViewController
        }
            
        self.expectation(for: myPredicate, evaluatedWith: navigationController)
            
        sut.searchButton.sendActions(for: .touchUpInside)
        
        waitForExpectations(timeout: 2)
    }
    
    func testViewedButton_WhenTapped_ArticleViewControllerIsPushed() throws {
        let myPredicate = NSPredicate { input, _ in
            return (input as? UINavigationController)?.topViewController is ArticleViewController
        }
            
        self.expectation(for: myPredicate, evaluatedWith: navigationController)
            
        sut.viewedButton.sendActions(for: .touchUpInside)
        
        waitForExpectations(timeout: 2)
    }

    func testSharedButton_WhenTapped_ArticleViewControllerIsPushed() throws {
        let myPredicate = NSPredicate { input, _ in
            return (input as? UINavigationController)?.topViewController is ArticleViewController
        }
            
        self.expectation(for: myPredicate, evaluatedWith: navigationController)
            
        sut.sharedButton.sendActions(for: .touchUpInside)
        
        waitForExpectations(timeout: 2)
    }
    
    func testEmailedButton_WhenTapped_ArticleViewControllerIsPushed() throws {
        let myPredicate = NSPredicate { input, _ in
            return (input as? UINavigationController)?.topViewController is ArticleViewController
        }
            
        self.expectation(for: myPredicate, evaluatedWith: navigationController)
            
        sut.emailedButton.sendActions(for: .touchUpInside)
        
        waitForExpectations(timeout: 2)
    }
}
