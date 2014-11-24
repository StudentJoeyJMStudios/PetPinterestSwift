//
//  CategorySelectionViewController.swift
//  PetPinterestSwift
//
//  Created by Joseph Richardson on 9/19/14.
//  Copyright (c) 2014 JMStudios. All rights reserved.
//

import UIKit

class CategorySelectionViewController: UIViewController, UITableViewDelegate
{
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return categoriesOfAnimals.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "category")
        println("cell for rowindex path")
        println(categoriesOfAnimals[indexPath.row]["name"])
        cell.textLabel.text = categoriesOfAnimals[indexPath.row]["name"] as? String
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {
        selectedAnimals.append(categoriesOfAnimals[indexPath.row] as PFObject)
        println(selectedAnimals)
    }
    
    @IBAction func selectAction(sender: AnyObject)
    {
        println("SELECTING ACTIONS NOW")
        performSegueWithIdentifier("actionSelection", sender: self)
    }
}
