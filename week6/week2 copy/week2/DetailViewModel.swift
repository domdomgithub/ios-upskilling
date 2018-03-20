//
//  DetailViewModel.swift
//  week2
//
//  Created by Dominic Lynn on 14/3/18.
//  Copyright © 2018 Dominic Lynn. All rights reserved.
//

import UIKit

class DetailViewModel: NSObject {

    var recipe:RecipeModel?
    
    func getRecipeTitle() -> String {
        return recipe!.title!
    }
    
    func getRecipeContent() -> String {
        return recipe!.content!
    }
    
}
