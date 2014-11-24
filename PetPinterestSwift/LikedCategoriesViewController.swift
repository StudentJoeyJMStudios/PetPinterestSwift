import UIKit

class LikedCategoriesViewController: UIViewController,UITableViewDelegate
{
    
    var likedCategories = (PFUser.currentUser())["likedCategories"] as [String]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return likedCategories.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "categoryList")
        cell.textLabel.text = likedCategories[indexPath.row] as String
        
        return cell
    }
    
}
