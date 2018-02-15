//
//  week2Tests.swift
//  week2Tests
//
//  Created by Dominic Lynn on 13/12/17.
//  Copyright © 2017 Dominic Lynn. All rights reserved.
//

import XCTest
@testable import week2

class week2Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testAddItem() {
        RecipeManager.addRecipe(title: "test recipe", content: "test content")
        let myRecipe = RecipeManager.getRecipe(id: RecipeManager.recipes.count-1)
        XCTAssertEqual(myRecipe.title, "test recipe")
    }
    
    func testDeleteItem() {
        let originalSize = RecipeManager.recipes.count
        RecipeManager.addRecipe(title: "test recipe", content: "test content")
        
        RecipeManager.deleteRecipe(id: RecipeManager.recipes.count-1)
        let newSize = RecipeManager.recipes.count
        
        XCTAssertEqual(newSize, originalSize)
    }
    
    func testInitRecipeModel() {
        let recipe = RecipeModel()
        recipe.title = "title"
        recipe.content = "content"
        
        XCTAssertEqual(recipe.title!, "title")
        XCTAssertEqual(recipe.content!, "content")
    }
    
}
