//
//  ChatsViewController.swift
//  whatsAppClone
//
//  Created by Vitor Henrique Barreiro Marinho on 19/05/22.
//

import UIKit
import FirebaseAuth

class ChatsViewController: UIViewController {
    
    let authentication = Auth.auth()
    
    @IBOutlet weak var table: UITableView!
    
    @IBAction func logOutButton(_ sender: Any) {
        
        do {
            try         authentication.signOut()
        } catch  {
            
        }
        
        
    }
    
    
    override func viewDidLoad() {
        table.delegate = self
        table.dataSource = self
    }
    
}

extension ChatsViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        if let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ChatsTableViewCell {
            
            cell.textLabel?.text = "Contato 1"
            
            return cell

        }
    
        return UITableViewCell()
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        300
    }
    
}
