//
//  NSUserDefaultsManager.swift
//  week2
//
//  Created by Dominic Lynn on 28/1/18.
//  Copyright © 2018 Dominic Lynn. All rights reserved.
//

import UIKit

class NSUserDefaultsManager: NSObject {
    static let userDefaults = UserDefaults.standard
    
    class func synchronize() {
        let myData = NSKeyedArchiver.archivedData(withRootObject: RecipeManager.recipes)
        UserDefaults.standard.set(myData, forKey: "recipeArray")
        UserDefaults.standard.synchronize()
    }
    
    class func initDefaults() {
        if let recipesRaw = UserDefaults.standard.data(forKey: "recipeArray") {
            if let recipes = NSKeyedUnarchiver.unarchiveObject(with: recipesRaw) as? [RecipeModel] {
                RecipeManager.recipes = recipes
            }
        }
    }
}
