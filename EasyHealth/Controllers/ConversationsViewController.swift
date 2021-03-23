//
//  ViewController.swift
//  EasyHealth
//
//  Created by David Guerrero on 3/15/21.
//

import UIKit
import FirebaseAuth

class ConversationsViewController: UIViewController {
    @IBOutlet var tableView : UITableView!

    private let noConversationLabel: UILabel = {
        let label = UILabel()
        label.text = "No Chats"
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 21, weight : .medium)
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(tappedComposedButton))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(noConversationLabel)
        tableView.delegate = self
        tableView.dataSource = self
        fetchConversations()
        //navigationController?.navigationBar.topItem?.title = "Chats"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    @objc private func tappedComposedButton(){
        let vc = NewConversationViewController()
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
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
    
    private func fetchConversations(){
        tableView.isHidden = false
    }

}

extension ConversationsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section : Int) -> Int{
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:  indexPath)
        cell.textLabel?.text = "Hello World"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = ChatViewController()
        vc.title = "Tatiana "
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
}
