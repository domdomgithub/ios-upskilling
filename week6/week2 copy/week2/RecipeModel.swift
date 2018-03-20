//
//  RecipeModel.swift
//  week2
//
//  Created by Dominic Lynn on 27/12/17.
//  Copyright © 2017 Dominic Lynn. All rights reserved.
//

import UIKit

class RecipeModel: NSObject, NSCoding {
    
    
    var title: String?
    var content: String?
    
    override init() {
        super.init()
    }
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
    }
    
    func encode(with aCoder: NSCoder) {
        if let titleEncoded = title {
            aCoder.encode(titleEncoded, forKey: "title")
        }
        
        if let contentEncoded = content {
            aCoder.encode(contentEncoded, forKey: "content")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        if let titleDecoded = aDecoder.decodeObject(forKey: "title") as? String {
            title = titleDecoded
        }
        
        if let contentDecoded = aDecoder.decodeObject(forKey: "content") as? String {
            content = contentDecoded
        }
    }
}
