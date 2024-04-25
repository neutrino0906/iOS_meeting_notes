//
//  CreateNoteViewController.swift
//  meeting_notes
//
//  Created by Ground 2 on 23/04/24.
//

import UIKit

enum EditDescription{
    case bold, italic, underline, leftAlign, rightAlign, centerAlign, link
}


class CreateNoteViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var navigationView: UIView!
    
    let statusBarHeight = UIApplication.shared.statusBarFrame.height
    let editDescriptionView = EditDescriptionView(frame: CGRect(x: 0, y: 100, width: 350, height: 33))
    static var isKeyboardOnScreen : Bool = false
    
    @IBOutlet var searchClientView: UIView!
    
    @IBOutlet var clientName: UILabel!
    
    @IBOutlet var addSubjectView: UIView!
    
    @IBOutlet var addSubjectTextfield: UITextField! {
        didSet {
                let PlaceholderText = NSAttributedString(string: "Add Subject",
                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "create_note_placeholder_color")!])
                
                addSubjectTextfield.attributedPlaceholder = PlaceholderText
            }
    }
    
    @IBOutlet var dateView: UIView!
    @IBOutlet var enterLabelView: UIView!
    @IBOutlet var descriptionView: UIView!
    @IBOutlet var attachmentsView: UIView!
    
    @IBOutlet var descriptionTextView: UITextView!
    
    @IBAction func closeButtonAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func createParagraphStyle(textAlignment: NSTextAlignment) -> NSParagraphStyle {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = textAlignment
        return paragraphStyle
    }
    
    
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
        
        searchClientView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSearchClientTap)))
        
        
        
        view.addSubview(navigationView)
        setupEditDescriptionView()
        
        
        descriptionTextView.delegate = self
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleKeyboardShow(keyboardShowNotification:)),
                                               name: UIResponder.keyboardDidShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleKeyboardHide(keyboardShowNotification:)),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(appMovedToBackground), name: UIScene.willDeactivateNotification, object: nil)
        
    }
    
    
        
    
    

}
