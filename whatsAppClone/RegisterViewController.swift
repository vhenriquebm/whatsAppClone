//
//  RegisterViewController.swift
//  whatsAppClone
//
//  Created by Vitor Henrique Barreiro Marinho on 19/05/22.
//

import UIKit
import FirebaseAuth

class RegisterViewController:UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    let imagePicker = UIImagePickerController()
    
    

    @IBOutlet weak var userImage: UIImageView!
    

 
    @IBAction func selectImage(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        userImage.image = image
        
      

        userImage.layer.cornerRadius = userImage.frame.size.width/2
        userImage.layer.shadowRadius = 50
        userImage.layer.shadowOpacity = 10
        userImage.clipsToBounds = true
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    @IBOutlet weak var userName:UITextField!
    
    @IBOutlet weak var userEmail:UITextField!
    
    @IBOutlet weak var UserPassword:UITextField!
    
    @IBOutlet weak var logIn: UIButton!
    
    let authentication = Auth.auth()
    
    
    
    override func viewDidLoad() {
        
        imagePicker.delegate = self
        
        logIn.layer.masksToBounds = true
       
        logIn.layer.borderWidth = 2
        logIn.layer.borderColor = UIColor.white.cgColor
       
        
    }
    
    
    @IBAction func logInButton(_ sender: Any) {
        
        guard let user = userName.text, let email = userEmail.text, let password = UserPassword.text else {return}
        
        authentication.createUser(withEmail: email, password: password) { result, erro in
            
            if erro == nil {
                
                print ("New user has been created")
                
                
            }
            else {
                
                print ("Sorry, we found a problem for create a new user")
            }
            
            self.performSegue(withIdentifier: "home", sender: self)
        }
        
        
        
        
    }
    
}
