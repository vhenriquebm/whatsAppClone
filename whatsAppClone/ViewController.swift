//
//  ViewController.swift
//  whatsAppClone
//
//  Created by Vitor Henrique Barreiro Marinho on 19/05/22.
//

import UIKit
import FirebaseAuth


class ViewController: UIViewController {
    
    
    @IBAction func unwindToViewController(_ unwindSegue: UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authentication.addStateDidChangeListener { autenticacao, usuario in
            
            if usuario != nil {
                
                self.performSegue(withIdentifier: "alreadyisauser", sender: self)
            }
            
        }
        
        
        logIn.layer.masksToBounds = true
       
        logIn.layer.borderWidth = 2
        logIn.layer.borderColor = UIColor.white.cgColor
        
    }
    
    
    @IBOutlet weak var userEmail: UITextField!
    
    @IBOutlet weak var userPassword: UITextField!
    
    
    let authentication = Auth.auth()
    
    
    @IBOutlet weak var logIn: UIButton!
    
    
  
    @IBAction func registerButton(_ sender: Any) {
        
            self.performSegue(withIdentifier: "registerSegue", sender: self)
    }
    
    
   

        
    @IBAction func logInButton(_ sender: Any) {
        
        guard let email = userEmail.text, let password = userPassword.text else {
            return}
        
        authentication.signIn(withEmail: email, password: password) { result, error in
            
            if error == nil {
                
                print ("Everything worked pretty well")
            }
            
        }
        
        performSegue(withIdentifier: "alreadyisauser", sender: self)
}
    }
    
    


