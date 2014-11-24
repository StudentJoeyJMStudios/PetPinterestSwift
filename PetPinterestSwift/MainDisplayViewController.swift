import UIKit

class MainDisplayViewController: UIViewController
{
    let choices = ["User Account","Recommendations","Lost and Found","Ligthpost"]
    var currentUser = PFUser.currentUser()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true;
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
        
        if choice == "User Account"{
            performSegueWithIdentifier("selectUserAccount", sender: self)
        }
        if choice == "Recommendations"{
            performSegueWithIdentifier("selectRecommendations", sender: self)
        }
        if choice == "Lost and Found"{
            performSegueWithIdentifier("selectLostAndFound", sender: self)
        }
    }
    
}
