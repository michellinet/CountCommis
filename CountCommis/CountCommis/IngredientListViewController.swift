//
//  IngredientListViewController.swift
//  CountCommis
//
//  Created by Michelline Tran on 2/23/17.
//  Copyright © 2017 Michelline Tran. All rights reserved.
//

import UIKit

class IngredientListTableViewController: UITableViewController {

    let groundTurkey = Ingredient(food: Food(name: "Ground Turkey", calories: 120), amount: 10)
        
    var dataArray = [Ingredient]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataArray.append(groundTurkey)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

//table will ask the class how many sections it has...
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

//table will ask the class how many rows within each section...
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
//table will ask what cell we want to display for a particular index...
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //as the cell comes off the bottom, it'll be reused at the top
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        //handling sections properly -- i.e. indexPath section 1, row 1 will be "Ground Turkey, 120"
        if indexPath.section == 0 {
           var ingredient = dataArray[indexPath.row]
            cell.textLabel?.text = groundTurkey.food.name + " - " + "Total Calories: \(groundTurkey.food.calories)"
        } else {
            cell.textLabel?.text = "More Ingredients"
        }
        
        return cell
    }

}
