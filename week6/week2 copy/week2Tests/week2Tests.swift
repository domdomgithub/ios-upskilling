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
        // given
        let originalSize = RecipeListModel.recipes.count
        
        // when
        RecipeListModel.addRecipe(title: "test recipe", content: "test content")
        
        // then
        let myRecipe = RecipeListModel.getRecipe(id: RecipeListModel.recipes.count-1)
        XCTAssertEqual(myRecipe.title, "test recipe")
        
        let newSize = RecipeListModel.recipes.count
        XCTAssertEqual(newSize, originalSize+1)
    }
    
    func testDeleteItem() {
        // given
        let originalSize = RecipeListModel.recipes.count
        RecipeListModel.addRecipe(title: "test recipe", content: "test content")
        
        // when
        RecipeListModel.deleteRecipe(id: RecipeListModel.recipes.count-1)
        
        // then
        let newSize = RecipeListModel.recipes.count
        XCTAssertEqual(newSize, originalSize)
    }
    
    func testInitRecipeModel() {
        // given
        let recipe = RecipeModel()
        
        // when
        recipe.title = "title"
        recipe.content = "content"
        
        // then
        XCTAssertEqual(recipe.title!, "title")
        XCTAssertEqual(recipe.content!, "content")
    }
  
//    // mvvm style?
//    func testMVVMAddItem() {
//        // given
//        var recipes = [RecipeModel]()
//
//        // when
//        let newRecipe = RecipeListViewModel.addRecipe(title: "new", content: "thing")
//        recipes.append(newRecipe)
//
//        // then
//        XCTAssertEqual(recipes.count, 1)
//    }
    
    
    
//    func testVC() {
//        let storyboard = UIStoryboard(name:"Main", bundle:nil)
//        let vc = storyboard.instantiateInitialViewController() as! UITableViewController
//        XCTAssertNotNil(vc.view, "no vc")
//
//        //vc.tableView(<#T##tableView: UITableView##UITableView#>, canEditRowAt: <#T##IndexPath#>)
//    }
    
}
