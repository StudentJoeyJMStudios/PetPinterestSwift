//
//  ActionSelectionViewController.swift
//  PetPinterestSwift
//
//  Created by John Melin on 21/10/14.
//  Copyright (c) 2014 JMStudios. All rights reserved.
//

import UIKit

class ActionSelectionViewController: UIViewController, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        println("din action selectionapejfasdjflskajdlfkjasdlfkjalskdjfal")
                println(actionsOfAnimals)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        println(actionsOfAnimals.count)
        return actionsOfAnimals.count;
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "action");
        cell.textLabel.text = actionsOfAnimals[indexPath.row]["name"] as String
        
        return cell;
    }
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {
        selectedActions.append(actionsOfAnimals[indexPath.row] as PFObject)
        println(selectedActions)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
