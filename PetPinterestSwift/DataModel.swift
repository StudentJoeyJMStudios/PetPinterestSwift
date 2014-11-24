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
var recommendations = [PFObject]()

func getAnimalCategories() -> ()
{
    var query = PFQuery(className:"Categories")
    
    query.findObjectsInBackgroundWithBlock
    {
        (objects: [AnyObject]!, error: NSError!) -> Void in
        if error == nil
        {
            categoriesOfAnimals = objects
            println(categoriesOfAnimals)
        }
        else
        {
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
                actionsOfAnimals = objects
                println(actionsOfAnimals)
            }
            else
            {
                NSLog("Error: %@ %@", error, error.userInfo!)
            }
    }
}


func getRecommendations() -> ()
{
    var user = PFUser.currentUser()
    var relation = user.relationForKey("Recommendations")
    
    relation.query().findObjectsInBackgroundWithBlock
        {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil
            {
                recommendations = objects as [PFObject]
                println(recommendations)
            }
            else
            {
                NSLog("Error: %@ %@", error, error.userInfo!)
            }
    }
}