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
    var selectedAnimals = [PFObject]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        
        return categoriesOfAnimals.count;
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "category");
        println("cell for rowindex path")
        println(categoriesOfAnimals[indexPath.row]["name"])
        cell.textLabel.text = categoriesOfAnimals[indexPath.row]["name"] as String
        
        
        return cell;
    }
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {
        selectedAnimals.append(categoriesOfAnimals[indexPath.row] as PFObject)
        
    }

    
    @IBAction func selectAction(sender: AnyObject) {
        println("SELECTING ACTIONS NOW")
        println(actionsOfAnimals.count)
        performSegueWithIdentifier("actionSelection", sender: self)

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
