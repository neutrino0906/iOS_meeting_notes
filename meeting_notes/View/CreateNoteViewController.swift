//
//  CreateNoteViewController.swift
//  meeting_notes
//
//  Created by Ground 2 on 23/04/24.
//

import UIKit

class CreateNoteViewController: UIViewController {
    
    @IBOutlet var navigationView: UIView!
    
    let statusBarHeight = UIApplication.shared.statusBarFrame.height
    
    @IBOutlet var searchClientView: UIView!
    @IBOutlet var addSubjectView: UIView!
    @IBOutlet var dateView: UIView!
    @IBOutlet var enterLabelView: UIView!
    @IBOutlet var descriptionView: UIView!
    @IBOutlet var attachmentsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationView.frame = CGRect(x: 0, y: statusBarHeight, width: view.frame.width, height: 42)
        searchClientView.frame = CGRect(x: 0, y: statusBarHeight + 42, width: view.frame.width, height: 34 )
        addSubjectView.frame = CGRect(x: 0, y: searchClientView.frame.maxY + 24, width: view.frame.width, height: 34 )
        dateView.frame = CGRect(x: 0, y: addSubjectView.frame.maxY + 24, width: view.frame.width, height: 34 )
        enterLabelView.frame = CGRect(x: 0, y: dateView.frame.maxY + 24, width: view.frame.width, height: 34 )
        descriptionView.frame = CGRect(x: 0, y: enterLabelView.frame.maxY + 24, width: view.frame.width, height: 374 )
        attachmentsView.frame = CGRect(x: 0, y: descriptionView.frame.maxY + 24, width: view.frame.width, height: 374 )
        
        view.addSubview(searchClientView)
        view.addSubview(addSubjectView)
        view.addSubview(dateView)
        view.addSubview(enterLabelView)
        view.addSubview(descriptionView)
        view.addSubview(attachmentsView)
        
        view.addSubview(navigationView)
        
    }
    

}
