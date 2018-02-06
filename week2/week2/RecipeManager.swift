//
//  RecipeController.swift
//  week2
//
//  Created by Dominic Lynn on 27/12/17.
//  Copyright © 2017 Dominic Lynn. All rights reserved.
//

import UIKit

class RecipeManager: NSObject {
    static var recipes = [RecipeModel]()
    
    class func addRecipe(title: String, content: String) {
        let recipe = RecipeModel(title: title, content: content)
        recipes.append(recipe)
    }
    
    class func deleteRecipe(id: Int) {
        recipes.remove(at: id)
    }
    
    class func getRecipe(id: Int) -> RecipeModel {
        if(recipes.count > 0) {
            return recipes[id]
        }
        
        return RecipeModel()
    }
}
