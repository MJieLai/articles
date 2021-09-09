//
//  SearchTests.swift
//  articlesTests
//
//  Created by Hexa-MingJie.Lai on 09/09/2021.
//

import XCTest
import ViewControllerPresentationSpy
@testable import articles

class SearchTests: XCTestCase {
    
    var sut: SearchViewController!
    var navigationController: UINavigationController!
    
    private var alertVerifier: AlertVerifier!
        
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        sut = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController
            
        sut.loadViewIfNeeded()
        navigationController = UINavigationController(rootViewController: sut)
        
        alertVerifier = AlertVerifier()
    }
        
    override func tearDownWithError() throws {
        sut = nil
        navigationController = nil
        alertVerifier = nil
    }
    
    func testOutletsAreConnected() throws {
        _ = try XCTUnwrap(sut.searchTextfield, "The search UITextField is not connected")
        _ = try XCTUnwrap(sut.searchButton, "The search UIButton is not connected")
    }
    
    func testSearchTextField_ShouldNotAllowSpecialCharacters() {
        let field: UITextField = sut.searchTextfield

        // Call through field.delegate, not through vc
        let result = (field.delegate?.textField!(field,
                             shouldChangeCharactersIn: NSMakeRange(0, 1),
                             replacementString: "!@#$")) ?? false

        XCTAssertTrue(result)
    }
    
    func testSearchButton_WithEmptyTextfield_ShouldPresentAlert() {
        sut.searchButton.sendActions(for: .touchUpInside)

        alertVerifier.verify(
            title: "Alert",
            message: "Please enter something to start searching",
            animated: true,
            actions: [
                .default("OK"),
            ],
            presentingViewController: sut
        )
    }
}

