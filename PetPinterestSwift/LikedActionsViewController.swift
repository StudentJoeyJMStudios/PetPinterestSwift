import UIKit

class LikedActionsViewController: UIViewController,UITableViewDelegate
{
    var likedActions = (PFUser.currentUser())["likedActions"] as [String]
    
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
        return likedActions.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "actionList")
        cell.textLabel.text = likedActions[indexPath.row] as String
        
        return cell
    }
    
}
