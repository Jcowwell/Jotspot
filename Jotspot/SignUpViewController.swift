//
//  SIgnUpViewController.swift
//  Jotspot
//
//  Created by Jevon Cowell on 9/16/17.
//  Copyright © 2017 TJS. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class SignUpViewController: UIViewController {

    //MARK: - Var
    
    var email: String?
    var password: String?

    //MARK: - TextFields
    
    @IBOutlet weak var signUpFirstNameTextField: UITextField!
    
    @IBOutlet weak var signUpLastNameTextField: UITextField!
    
    @IBOutlet weak var signUpEmailTextField: UITextField!
    
    @IBOutlet weak var signUpEmailConfirmationTextField: UITextField!
    
    @IBOutlet weak var signUpPasswordTextField: UITextField!
    
    //MARK: - Buttons
    
    @IBAction func didTapSignUp(_ sender: Any) {
        Auth.auth().signIn(withEmail: email!, password: password!) { (user, error) in
            // ...
        }

    }
    
    @IBAction func didTapCancel(_ sender: Any) {
    }

    
    
    @IBAction func didRequestPasswordReset(_ sender: AnyObject) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
