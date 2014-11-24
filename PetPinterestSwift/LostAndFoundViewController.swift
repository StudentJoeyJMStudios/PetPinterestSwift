import UIKit

class LostAndFoundViewController: UIViewController {

    @IBOutlet weak var animalName: UITextField!
    @IBOutlet weak var animalReward: UITextField!
    @IBOutlet weak var animalCategory: UITextField!
    @IBOutlet weak var animalColor: UITextField!
    @IBOutlet weak var animalPattern: UITextField!
    @IBOutlet weak var animalMedInfo: UITextField!
    @IBOutlet weak var animalHairLenght: UITextField!
    @IBOutlet weak var animalSize: UITextField!
    @IBOutlet weak var lastSeenLocation: UITextField!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI()
    {
        animalReward.placeholder = "Enter reward"
        animalMedInfo.placeholder = "Enter medical info"
        animalColor.placeholder = "Enter animal color"
        lastSeenLocation.placeholder = "Enter last seen location"
        animalHairLenght.placeholder = "Enter hairlength"
        animalName.placeholder = "Enter animal name"
        animalPattern.placeholder = "Enter fur pattern"
        animalCategory.placeholder = "Enter category"
        animalSize.placeholder = "Enter animal size"
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func createdLostPost(sender: AnyObject)
    {
        let name = animalName.text
        let category = animalCategory.text
        let location = lastSeenLocation.text
        
        if name.isEmpty || category.isEmpty || location.isEmpty{
            let alert = UIAlertController(title: "Error", message: "Please fill out required fields!",
                preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,
                handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
            
            checkForFill(animalName, text: name)
            checkForFill(animalCategory, text: category)
            checkForFill(lastSeenLocation, text: location)
        }else{
            saveOptionsToDatabase()
            performSegueWithIdentifier("createdLostPost", sender: self)
        }
    }
    
    func saveOptionsToDatabase()
    {
        var lostAnimal = PFObject(className:"LostAnimalPost")
       // var lostAnimalUserRelation = lostAnimal.relationForKey("contactUser")
       
        //lostAnimalUserRelation.addObject(PFUser.currentUser())
        lostAnimal["name"] = animalName.text
        lostAnimal["lastKnownAdress"] = lastSeenLocation.text
        lostAnimal["category"] = animalCategory.text
        lostAnimal["colors"] = animalColor.text
        lostAnimal["reward"] = animalReward.text
        lostAnimal["size"] = animalSize.text
        lostAnimal["hairLength"] = animalHairLenght.text
        lostAnimal["medicalInfo"] = animalMedInfo.text
        lostAnimal["pattern"] = animalPattern.text
        
        // lostAnimal["contactUser"] = user["name"] as String
        lostAnimal.saveInBackground()
    }
    
    func checkForFill(textField : UITextField, text : String!)
    {
        if text.isEmpty{
            textField.backgroundColor = UIColor.redColor()
            textField.alpha = 0.3;
        }else{
            textField.backgroundColor = nil
        }
    }
}
