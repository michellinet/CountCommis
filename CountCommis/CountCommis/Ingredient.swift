//
//  Ingredient.swift
//  CountCommis
//
//  Created by Michelline Tran on 2/23/17.
//  Copyright © 2017 Michelline Tran. All rights reserved.
//

import UIKit

class Ingredient: NSObject {
    
    //MARK: Properties
    
    let food: Food
    let amount: Float
    
    //MARK: Initialization
    
    init(food: Food, amount: Float) {
        self.food = food
        self.amount = amount
        super.init()
    }
}
