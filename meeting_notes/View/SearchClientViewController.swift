//
//  SearchClientViewController.swift
//  meeting_notes
//
//  Created by Ground 2 on 24/04/24.
//

import UIKit

class SearchClientViewController: UIViewController {
    var callbackToCreateNote : ((String) -> Void)?
    
    var clientList : [String] = ["Dev kumar", "Dev Kumar Dutta", "Aaru Devdutta Kulkarni", "Amit Kishore", "Bhuma Devi R", "Deepak Govindrao Devat Raj"]
    
    
    @IBOutlet var navigationBar: UIView!

    
    @IBOutlet var searchClientTextfield: UITextField!
    
    @IBOutlet var clientSearchResultTableView: UITableView!
    
    
    @IBAction func closeSearchClientButton(_ sender: Any) {
        
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Adding the navigation Bar
        navigationBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 71)
//        navigationBar.backgroundColor = .red
        view.addSubview(navigationBar)
        
        
        //Adding the seacrh text field
        searchClientTextfield.frame = CGRect(x: 16, y: navigationBar.frame.maxY + 16, width: view.frame.width - 32, height: 32)
//        searchClientTextfield.layer.cornerRadius = 4
//        searchClientTextfield.placeholder = ""
        view.addSubview(searchClientTextfield)
        
        
        //Adding the table view to show search results
        clientSearchResultTableView.delegate = self
        clientSearchResultTableView.dataSource = self
        clientSearchResultTableView.layer.cornerRadius = 4
        clientSearchResultTableView.frame = CGRect(x: 16, y: searchClientTextfield.frame.maxY + 16, width: view.frame.width - 32, height: view.frame.height - navigationBar.frame.height - searchClientTextfield.frame.height - 32)
    }
    


}

