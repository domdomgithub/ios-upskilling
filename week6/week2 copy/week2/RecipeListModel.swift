//
//  RecipeListViewModel
//  week2
//
//  Created by Dominic Lynn on 14/3/18.
//  Copyright © 2018 Dominic Lynn. All rights reserved.
//

import UIKit

class RecipeListModel: NSObject {
    
    static var recipes = [RecipeModel]()
    internal var storageService: NSUserDefaultsManager
    
    init(storageService: NSUserDefaultsManager = NSUserDefaultsManager.storageService) {
        self.storageService = storageService
    }
    
    func addRecipe(title: String, content: String) {
        RecipeListViewModel.addRecipe(title: title, content: content)
        storageService.synchronize(object: RecipeListModel.recipes)
    }
    
    func deleteRecipe(id: Int) {
        RecipeListViewModel.deleteRecipe(at: id)
        storageService.synchronize(object: RecipeListModel.recipes)
    }
    
    func getRecipe(id: Int) -> RecipeModel {
        return RecipeListViewModel.getRecipe(at: id)
    }
    
    func loadRecipes() {
        storageService.initDefaults()
    }
    
}

