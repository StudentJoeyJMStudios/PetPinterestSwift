import UIKit

class RecommendationsViewController: UIViewController
{
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
      return recommendations.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "relations")
        cell.textLabel.text = recommendations[indexPath.row]["name"] as? String
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {

    }
    
}
