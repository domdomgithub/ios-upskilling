//
//  week2UITests.swift
//  week2UITests
//
//  Created by Dominic Lynn on 13/12/17.
//  Copyright © 2017 Dominic Lynn. All rights reserved.
//

import XCTest

class week2UITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddRecipe() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        let app = XCUIApplication()
        let recipesNavigationBar = app.navigationBars["Recipes"]
        recipesNavigationBar.buttons["Add"].tap()
        
        let element = app.otherElements.containing(.navigationBar, identifier:"Title").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let textField = element.children(matching: .textField).element
        textField.tap()
        textField.typeText("test Recipe")
        
        let textView = element.children(matching: .textView).element
        textView.tap()
        textView.tap()
        textView.typeText("test recipe entry")
        app.buttons["Add"].tap()
        
        
    }
    
    func testDeleteRecipe() {
        
        let app = XCUIApplication()
        app.navigationBars["Recipes"].buttons["Add"].tap()
        
        let element = app.otherElements.containing(.navigationBar, identifier:"Title").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let textField = element.children(matching: .textField).element
        textField.tap()
        textField.typeText("Delete Me")
        
        let textView = element.children(matching: .textView).element
        textView.tap()
        textView.tap()
        textView.typeText("to be deleted...")
        app.buttons["Add"].tap()
        app.navigationBars["Title"].buttons["Recipes"].tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Delete Me"]/*[[".cells.staticTexts[\"Delete Me\"]",".staticTexts[\"Delete Me\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        tablesQuery.buttons["Delete"].tap()
        
    }
    
}
