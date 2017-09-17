//
//  SignInViewController.swift
//  Jotspot
//
//  Created by Jevon Cowell on 9/16/17.
//  Copyright © 2017 TJS. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth



class SignInViewController: UIViewController {

    //MARK: - Var
    var handle: AuthStateDidChangeListenerHandle?
    var email: String?
    var password: String?
    
    //MARK: - TextFields
    
    @IBOutlet weak var signInEmailTextField: UITextField!
    @IBOutlet weak var signInPasswordEmailField: UITextField!
    
    //MARK: - Buttons
    @IBAction func didTapSignIn(_ sender: Any) {
        Auth.auth().signIn(withEmail: email!, password: password!) { (user, error) in
            // ...
        }
    }
    
    @IBAction func didTapSignUp(_ sender: Any) {
        
    }
    
    @IBAction func didTapSkip(_ sender: Any) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // [START auth_listener]
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
        
        }
        
    func viewDidDisappear() {
        super.viewDidDisappear(true)
            
            Auth.auth().removeStateDidChangeListener(handle!)
        }
        // Do any additional setup after loading the view.
    

    func didReceiveMemoryWarning() {
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

}
