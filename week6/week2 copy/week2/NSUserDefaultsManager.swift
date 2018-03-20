//
//  NSUserDefaultsManager.swift
//  week2
//
//  Created by Dominic Lynn on 28/1/18.
//  Copyright © 2018 Dominic Lynn. All rights reserved.
//

import UIKit

class NSUserDefaultsManager {
    static let userDefaults = UserDefaults.standard
    static let storageService = NSUserDefaultsManager()
    
    func synchronize(object:Any) {
        let myData = NSKeyedArchiver.archivedData(withRootObject: object)
        UserDefaults.standard.set(myData, forKey: "rootObject")
        UserDefaults.standard.synchronize()
    }
    
    func initDefaults() {
        if let objectRaw = UserDefaults.standard.data(forKey: "rootObject") {
            if let object = NSKeyedUnarchiver.unarchiveObject(with: objectRaw) as? [RecipeModel] {
                RecipeListModel.recipes = object
            }
        }
    }
}
