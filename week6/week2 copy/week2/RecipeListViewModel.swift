//
//  RecipeListViewModel.swift
//  week2
//
//  Created by Dominic Lynn on 20/3/18.
//  Copyright © 2018 Dominic Lynn. All rights reserved.
//

import UIKit

class RecipeListViewModel {

    func addRecipe(title: String, content: String) {
        let r = RecipeModel.init(title: title, content: content)
        RecipeListModel.recipes.append(r)
    }
    
    func deleteRecipe(id: Int) {
        RecipeListModel.recipes.remove(at: id)
    }
    
    func getRecipe(id: Int) -> RecipeModel {
        if(RecipeListModel.recipes.count > 0) {
            return RecipeListModel.recipes[id]
        }
        
        return RecipeModel()
    }
    
}
