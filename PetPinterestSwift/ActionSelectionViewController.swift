
import UIKit

class ActionSelectionViewController: UIViewController, UITableViewDelegate
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        println(actionsOfAnimals)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return actionsOfAnimals.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "actions")
        cell.textLabel.text = actionsOfAnimals[indexPath.row]["name"] as String?
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {
        selectedActions.append(actionsOfAnimals[indexPath.row] as PFObject)
        println(selectedActions)
    }
    
    @IBAction func selectMainMenu(sender: AnyObject)
    {
        saveOptionsToDatabase()
        performSegueWithIdentifier("selectMainMenu", sender: self)
    }
    
    func saveOptionsToDatabase()
    {
        var stringActions = [String]()
        var stringAnimals = [String]()
        
        for action in selectedActions{
            stringActions.append(action["name"] as String)
        }
        for animal in selectedAnimals{
            stringAnimals.append(animal["name"] as String)
        }
        var currentUser = PFUser.currentUser()
        
        currentUser.addUniqueObjectsFromArray(stringActions, forKey:"likedActions")
        currentUser.addUniqueObjectsFromArray(stringAnimals, forKey:"likedCategories")
        currentUser.saveEventually()
    }
}
