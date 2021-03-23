//
//  ViewController.swift
//  EasyHealth
//
//  Created by David Guerrero on 3/15/21.
//

import UIKit
import FirebaseAuth

class ConversationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationController?.navigationBar.topItem?.title = "Chats"
    }

    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        
        validateAuth()
   
    }
    
    private func validateAuth(){
        if FirebaseAuth.Auth.auth().currentUser == nil {
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)
            
        }
    }

}

