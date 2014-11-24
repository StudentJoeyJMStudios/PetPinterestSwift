//
//  BoardsViewController.swift
//  PetPinterestSwift
//
//  Created by John Melin on 22/11/14.
//  Copyright (c) 2014 JMStudios. All rights reserved.
//

import UIKit

class BoardsViewController: UIViewController {
    @IBOutlet weak var boardName: UITextField!
    @IBOutlet weak var boardDescription: UITextField!
    @IBOutlet weak var boardCategory: UITextField!
    @IBOutlet weak var doneButton: UIButton!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupUI()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func setupUI()
    {
        boardName.placeholder = "Enter boardname"
        boardDescription.placeholder = "Enter description"
        boardCategory.placeholder = "Enter category"
    }
    
    @IBAction func createdBoard(sender: AnyObject)
    {
        
        let name = boardName.text
        let description = boardDescription.text
        let category = boardCategory.text
        
        if name.isEmpty || description.isEmpty || category.isEmpty {
            let alert = UIAlertController(title: "Error", message: "Please fill out the required fields!",
                preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,
                handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
            checkForFill(boardName, text: name)
            checkForFill(boardDescription, text: description)
            checkForFill(boardCategory, text: category)
        }else{
            saveOptionsToDatabase()
            performSegueWithIdentifier("createdBoard", sender: self)
        }
    }
    
    func saveOptionsToDatabase()
    {
        var board = PFObject(className:"Boards")
        var user = PFUser.currentUser()
        board["name"] = boardName.text
        board["description"] = boardDescription.text
        board["category"] = boardCategory.text
        board["createdBy"] = user["username"] as String
        board.saveEventually()
    }
    
    func checkForFill(textField : UITextField, text : String!)
    {
        if text.isEmpty{
            textField.backgroundColor = UIColor.redColor()
            textField.alpha = 0.3;
        }else{
            textField.backgroundColor = nil
        }
    }
}
