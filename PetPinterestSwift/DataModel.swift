//
//  DataModel.swift
//  PetPinterestSwift
//
//  Created by Joseph Richardson on 9/20/14.
//  Copyright (c) 2014 JMStudios. All rights reserved.
//

import Foundation

var categoriesOfAnimals = [AnyObject]()
var selectedAnimals = [PFObject]()
var actionsOfAnimals = [AnyObject]()
var selectedActions = [PFObject]()


func getAnimalCategories() -> ()
{
    var query = PFQuery(className:"Categories")
    
    query.findObjectsInBackgroundWithBlock
    {
        (objects: [AnyObject]!, error: NSError!) -> Void in
        if error == nil
        {
            // The find succeeded.
           
            // Do something with the found objects
            
            categoriesOfAnimals = objects
            
            println(categoriesOfAnimals)
            
        }
        else
        {
            // Log details of the failure
            NSLog("Error: %@ %@", error, error.userInfo!)
        }
    }
}

func getAnimalActions() -> ()
{
    var query = PFQuery(className:"Actions")
    
    query.findObjectsInBackgroundWithBlock
        {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil
            {
                // The find succeeded.
                
                // Do something with the found objects
                
                actionsOfAnimals = objects
                
                println(actionsOfAnimals)
            }
            else
            {
                // Log details of the failure
                NSLog("Error: %@ %@", error, error.userInfo!)
            }
    }
}

