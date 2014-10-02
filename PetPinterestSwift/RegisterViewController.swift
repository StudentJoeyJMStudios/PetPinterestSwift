//
//  RegisterViewController.swift
//  PetPinterestSwift
//
//  Created by Joseph Richardson on 9/11/14.
//  Copyright (c) 2014 JMStudios. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController
{
    @IBOutlet weak var registerUsername: UITextField!
    @IBOutlet weak var registerPassword: UITextField!
    
    var buttonClickMax : Int = 1
    
    override func viewDidLoad()
    {
        buttonClickMax = 0
    }
    
    @IBAction func registerNewUser(sender: AnyObject)
    {
        buttonClickMax++
        
        if (buttonClickMax == 1)
        {
            
            registerNewUser()

        }
    }
    
    
    func registerNewUser() -> ()
    {
        var username : String = registerUsername.text
        var password : String = registerPassword.text
        
        var user = PFUser()
        
        user.username = username
        user.password = password
        
        user.signUpInBackgroundWithBlock
        {
            (succeeded: Bool!, error: NSError!) -> Void in
            if error == nil
            {
                self.performSegueWithIdentifier("chooseCategories", sender: self)
            }
            else
            {
                //let errorString = error.userInfo["error"] as NSString
                // Show the errorString somewhere and let the user try again.
            }
        }
    }

}
