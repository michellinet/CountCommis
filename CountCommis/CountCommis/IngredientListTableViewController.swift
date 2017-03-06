//
//  IngredientListTableViewController.swift
//  CountCommis
//
//  Created by Michelline Tran on 2/23/17.
//  Copyright © 2017 Michelline Tran. All rights reserved.
//

import UIKit
import os.log

class IngredientListTableViewController: UITableViewController {

    let groundTurkey = Ingredient(food: Food(name: "Ground Turkey", calories: 120), amount: 10)
    
    var ingredientList = [Ingredient]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ingredientList.append(groundTurkey)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

//table will ask the class how many sections it has...
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

//table will ask the class how many rows within each section...
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientList.count
    }
    
//table will ask what cell we want to display for a particular index...
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //as the cell comes off the bottom, it'll be reused at the top
        let cellIdentifier = "IngredientTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? IngredientTableViewCell
            else {
            fatalError("The dequeued cell is not an instance of IngredientTableViewCell.")
        }
        
        let ingredient = ingredientList[indexPath.row]
        
        cell.textLabel?.text = ingredient.food.name + " - " + "Total Calories: \(ingredient.food.calories)"
       
        return cell
    }
    //MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
        
        case "AddItem" : os_log("Adding a new meal.", log: OSLog.default, type: .debug)
        
        case "ShowDetail" :
            guard let ingredientDetailViewController = segue.destination as? IngredientViewController else {
                    fatalError("Unexpected destination: \(segue.destination)")
            }
           
            guard let selectedIngredientCell = sender as? IngredientTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedIngredientCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedIngredient = ingredientList[indexPath.row]
            ingredientDetailViewController.ingredient = selectedIngredient
        default :
            fatalError("Unexpected Segue Identifier: \(segue.identifier)")
        }
    }
    
    //MARK: Actions
    @IBAction func unwindToIngredientList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? IngredientViewController, let ingredient = sourceViewController.ingredient {
            
            //Add a new meal
            let newIndexPath = IndexPath(row: ingredientList.count, section: 0)
            
            ingredientList.append(ingredient)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }

}


