import UIKit

class UserAccountViewController: UIViewController
{
    let choices = ["Create New Board","Make New Post","Liked Actions","Liked Categories"]
    var currentUser = PFUser.currentUser()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return choices.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "choices")
        cell.textLabel.text = choices[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {
        let choice = choices[indexPath.row]
        if choice == "Create New Board"{
            performSegueWithIdentifier("selectNewBoard", sender: self)
        }
        if choice == "Make New Post"{
            performSegueWithIdentifier("selectNewPost", sender: self)
        }
        if choice == "Liked Actions"{
            performSegueWithIdentifier("selectLikedActions", sender: self)
        }
        if choice == "Liked Categories"{
            performSegueWithIdentifier("selectLikedCategories", sender: self)
        }
    }
    
}
