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
    lazy var bottomHomeButtonHeight = view.safeAreaInsets.bottom
    
    @IBOutlet var createNoteButtonView: UIView!
    @IBOutlet var createNoteButtonContainer: UIView!
    
    @IBOutlet var notesTableView: UITableView!
    @IBOutlet var noNotesFoundView: UIStackView!
    
    let cellIdentifier = "notesCell"
    
    var notesList : [NoteModel] = [
        NoteModel(clientName: "Meherban Singh", subject: "Retirement Income Strategy", createDate: "22-11-2023", updateDate: "25-12-2023", labels: ["a", "b","c","d"]),
        NoteModel(clientName: "Rakesh Sinha", subject: "Risk Toleration Evaluation", createDate: "15-10-2023", updateDate: "28-12-2023", labels: []),
        NoteModel(clientName: "Mukesh Agnihotri", subject: "Portfolio Performance Review", createDate: "02-10-2023", updateDate: "08-10-2023", labels: ["c"]),
        NoteModel(clientName: "Mahesh Kapoor", subject: "Asset Allocation Assesment", createDate: "23-02-2024", updateDate: "03-05-2023", labels: ["abcd"]),
        NoteModel(clientName: "Meherban Singh", subject: "Retirement Income Strategy", createDate: "22-11-2023", updateDate: "25-12-2023", labels: ["a", "b"]),
        NoteModel(clientName: "Rakesh Sinha", subject: "Risk Toleration Evaluation", createDate: "15-10-2023", updateDate: "28-12-2023", labels: []),
        NoteModel(clientName: "Mukesh Agnihotri", subject: "Portfolio Performance Review", createDate: "02-10-2023", updateDate: "08-10-2023", labels: ["c"]),
        NoteModel(clientName: "Mahesh Kapoor", subject: "Asset Allocation Assesment", createDate: "23-02-2024", updateDate: "03-05-2023", labels: ["abcd"]),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationView.frame = CGRect(x: 0, y: statusBarHeight, width: view.frame.width, height: 42)
        
        if notesList.isEmpty{
            noNotesFoundView.isHidden = false
            
            createNoteButtonView.frame = CGRect(x: 0, y: 0, width: createNoteButtonContainer.frame.width, height: createNoteButtonContainer.frame.height)
            createNoteButtonContainer.layer.cornerRadius = 4
            createNoteButtonContainer.clipsToBounds = true
            createNoteButtonContainer.addSubview(createNoteButtonView)
        }
        else{
            
            
            notesTableView.dataSource = self
            notesTableView.delegate = self
            
            notesTableView.frame = CGRect(x: 0, y: statusBarHeight + 42, width: view.frame.width, height: view.frame.height - 74 - bottomHomeButtonHeight - 50 - statusBarHeight)
            
            
            notesTableView.separatorStyle = .none
            
            createNoteButtonView.frame = CGRect(x: 8, y: notesTableView.frame.maxY + 8 , width: view.frame.width - 16, height: 42)
            createNoteButtonView.layer.cornerRadius = 4
            view.addSubview(createNoteButtonView)
            
            let nib = UINib(nibName: "NotesTableViewCell", bundle: nil)
            notesTableView.register(nib, forCellReuseIdentifier: cellIdentifier)
        }
        
        createNoteButtonView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleCreateNoteButtonView)))
        
        view.addSubview(navigationView)
        
    }
    
    
    @objc func handleCreateNoteButtonView(){
        let vc = self.storyboard?.instantiateViewController(identifier: "CreateNoteViewController") as! CreateNoteViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }



}

