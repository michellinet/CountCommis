//
//  IngredientListViewController.swift
//  CountCommis
//
//  Created by Michelline Tran on 2/23/17.
//  Copyright © 2017 Michelline Tran. All rights reserved.
//

import UIKit

class IngredientListTableViewController: UITableViewController {
    //inheriting from UITableViewController lets us inherit automaticaly delegation & data source or protocols
   
    //Saving these values for later, for now use hardcoded values
    //    let firstIngredient = Ingredient(name: "Ground Turkey", servingSize: 100, calories: 120)
    //    let secondIngredient = Ingredient(name: "Bell Peppers", servingSize: 50, calories: 10)
    //    let thirdIngredient = Ingredient(name: "Quinoa", servingSize: 100, calories: 98)


    let dataArray = ["Ground Turkey, 120", "Bell Peppers, 10", "Quinoa, 98"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            cell.textLabel?.text = dataArray[indexPath.row]
        } else {
            cell.textLabel?.text = "More Ingredients"
        }
        
        return cell
    }

}
