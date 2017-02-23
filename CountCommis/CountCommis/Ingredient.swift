//
//  Ingredient.swift
//  CountCommis
//
//  Created by Michelline Tran on 2/23/17.
//  Copyright © 2017 Michelline Tran. All rights reserved.
//

import Foundation

class Ingredient: NSObject {
    let name: String
    let servingSize: Int
    let calories: Int
    
    init(name: String, servingSize: Int, calories: Int) {
        self.name = name
        self.servingSize = servingSize
        self.calories = calories
        super.init()
    }
}
