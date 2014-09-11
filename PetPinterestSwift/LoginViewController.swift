//
//  LoginViewController.swift
//  PetPinterestSwift
//
//  Created by Joseph Richardson on 9/11/14.
//  Copyright (c) 2014 JMStudios. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController
{
    @IBOutlet weak var loginUsername: UITextField!

    @IBOutlet weak var loginPassword: UITextField!
    
    @IBAction func registerNewUser(sender: AnyObject)
    {
        performSegueWithIdentifier("registerNewUser", sender: self)
    }
    
    
    @IBAction func loginUser(sender: AnyObject)
    {
        var username : String = loginUsername.text
        var password : String = loginPassword.text
        
        PFUser.logInWithUsernameInBackground(username, password:password)
            {
            (user: PFUser!, error: NSError!) -> Void in
            
            if user != nil
            {
                self.performSegueWithIdentifier("mainDisplay", sender: self)
            }
            else
            {
                // The login failed. Check error to see why.
            }
        }
    }
}
