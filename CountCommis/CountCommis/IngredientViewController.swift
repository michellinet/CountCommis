//
//  IngredientViewController.swift
//  CountCommis
//
//  Created by Michelline Tran on 3/4/17.
//  Copyright © 2017 Michelline Tran. All rights reserved.
//

import UIKit
import os.log


class IngredientViewController : UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!

    /*
     This value is either passed by IngredientListTableViewController` in `prepare(for:sender:)` or constructed as part of adding a new ingredient.
    */
    var ingredient : Ingredient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Handle text field's user input through delegate callbacks.
        nameTextField.delegate = self
        if let ingredient = ingredient {
            navigationItem.title = ingredient.food.name
            nameTextField.text = ingredient.food.name
            amountTextField.text = "\(ingredient.amount)"
        }
        
        //Enable Save button only if text field has a valid Ingredient name.
        updateSaveButtonState()
    }
    
    //MARK: UITextFieldDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //Disable Save while editing
        saveButton.isEnabled = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    
    //MARK: Navigation
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    //This lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        //Configure the destination view controller only when the save button is pressed
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling.", log: OSLog.default, type: .debug)
            return
        }
        
        let name = nameTextField.text ?? ""
        let calories = 120
        let amount : Float = NSString(string: amountTextField.text ?? "").floatValue
        
        //Set ingredient to be passed to IngredientListTableViewController after the unwind segue.
        ingredient = Ingredient(food: Food(name: name, calories: calories), amount: amount)
    }
    
    //MARK: Actions
   //    @IBAction func setDefaultLabelText(_ sender: UIButton) {
//        ingredientNameLabel.text = "Default Text"
//    }
    
    //MARK: Private Methods
    
    private func updateSaveButtonState() {
        //Disable the Save futton if the text field is empty.
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
}
