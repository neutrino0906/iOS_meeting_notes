//
//  ViewController.swift
//  meeting_notes
//
//  Created by Ground 2 on 22/04/24.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet var navigationView: UIView!
    
    let statusBarHeight = UIApplication.shared.statusBarFrame.height
    
    @IBOutlet var createNoteButtonView: UIView!
    @IBOutlet var createNoteButtonContainer: UIView!
    
    @IBOutlet var notesTableView: UITableView!
    @IBOutlet var noNotesFoundView: UIStackView!
    
    let cellIdentifier = "notesCell"
    
    var array: [String] = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationView.frame = CGRect(x: 0, y: statusBarHeight, width: view.frame.width, height: 42)
        
        if array.isEmpty{
            noNotesFoundView.isHidden = false
            
            createNoteButtonView.frame = CGRect(x: 0, y: 0, width: createNoteButtonContainer.frame.width, height: createNoteButtonContainer.frame.height)
            createNoteButtonContainer.addSubview(createNoteButtonView)
        }
        else{
            
            
            notesTableView.dataSource = self
            notesTableView.delegate = self
            
            notesTableView.frame = CGRect(x: 0, y: statusBarHeight + 42, width: view.frame.width, height: view.frame.height - 74 - 42 - statusBarHeight)
            
            
            notesTableView.separatorStyle = .none
            
            createNoteButtonView.frame = CGRect(x: 8, y: notesTableView.frame.maxY + 8, width: view.frame.width - 16, height: 42)
            createNoteButtonView.layer.cornerRadius = 4
            view.addSubview(createNoteButtonView)
            
            let nib = UINib(nibName: "NotesTableViewCell", bundle: nil)
            notesTableView.register(nib, forCellReuseIdentifier: cellIdentifier)
        }
        
        view.addSubview(navigationView)
        
    }
    
    



}

