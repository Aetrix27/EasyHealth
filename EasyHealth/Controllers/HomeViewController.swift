//
//  HomeViewController.swift
//  EasyHealth
//
//  Created by David Guerrero on 3/15/21.
//

import UIKit


class HomeViewController: UIViewController {
    
    @IBAction func login(_ sender: Any) {
        let vc = LoginViewController()
        let nav = UINavigationController(rootViewController: vc)
        
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: false)
    }
    
    @IBAction func register(_ sender: Any) {
        let vc = RegisterViewController()
        let nav = UINavigationController(rootViewController: vc)
        
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: false)
        
    }
    
    @IBAction func viewChats(_ sender: Any) {
        let vc = ConversationsViewController()
        let nav = UINavigationController(rootViewController: vc)
        
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let vc = segue.destination as? LoginViewController
        
     

        
        }
    

}
