//
//  CreateNoteViewModel.swift
//  meeting_notes
//
//  Created by Ground 2 on 24/04/24.
//

import Foundation
import UIKit

extension CreateNoteViewController{
    
    @objc func handleSearchClientTap(){
        let vc = self.storyboard?.instantiateViewController(identifier: "SearchClientViewController") as! SearchClientViewController
        vc.callbackToCreateNote = {
            name in
            self.clientName.text = name
            self.clientName.textColor = .black
        }
        
        self.present(vc, animated: true)
        
        
    }
    
    func setupEditDescriptionView(){
        let boldView : UIImageView = {
            let view = UIImageView()
            view.contentMode = .scaleAspectFit
            view.image = UIImage(named: "bold_ic")?.addImagePadding(x: 9.5, y: 9.5)
            view.backgroundColor = UIColor(named: "edit_description_bg")
            return view
        }()
        
        let underlineView : UIImageView = {
            let view = UIImageView()
            view.contentMode = .scaleAspectFit
            view.image = UIImage(named: "underline_ic")?.addImagePadding(x: 9.5, y: 9.5)
            view.backgroundColor = UIColor(named: "edit_description_bg")
            return view
        }()
        
        let italicView : UIImageView = {
            let view = UIImageView()
            view.contentMode = .scaleAspectFit
            view.image = UIImage(named: "italic_ic")?.addImagePadding(x: 9.5, y: 9.5)
            view.backgroundColor = UIColor(named: "edit_description_bg")
            return view
        }()
        
        let linkView : UIImageView = {
            let view = UIImageView()
            view.contentMode = .scaleAspectFit
            view.image = UIImage(named: "link_ic")?.addImagePadding(x: 9.5, y: 9.5)
            view.backgroundColor = UIColor(named: "edit_description_bg")
            return view
        }()
        
        let leftAlignView : UIImageView = {
            let view = UIImageView()
            view.contentMode = .scaleAspectFit
            view.image = UIImage(named: "leftAlign_ic")?.addImagePadding(x: 9.5, y: 9.5)
            view.backgroundColor = UIColor(named: "edit_description_bg")
            return view
        }()
        
        let centerAlignView : UIImageView = {
            let view = UIImageView()
            view.contentMode = .scaleAspectFit
            view.image = UIImage(named: "centerAlign_ic")?.addImagePadding(x: 9.5, y: 9.5)
            view.backgroundColor = UIColor(named: "edit_description_bg")
            return view
        }()
        
        let rightAlignView : UIImageView = {
            let view = UIImageView()
            view.contentMode = .scaleAspectFit
            view.image = UIImage(named: "rightAlign_ic")?.addImagePadding(x: 9.5, y: 9.5)
            view.backgroundColor = UIColor(named: "edit_description_bg")
            return view
        }()
        
        
        
        editDescriptionView.views = [boldView,underlineView, italicView, linkView, leftAlignView, centerAlignView, rightAlignView]
        
        
        
                
        editDescriptionView.didSelectView = {
            view, index, isSelected in
            print(index)
            
            switch index{
            case 0:
                self.updateTextView(.bold)
                
            case 1:
                self.updateTextView(.underline)
                
            case 2:
                self.updateTextView(.italic)
                
            case 3:
                self.updateTextView(.link)
                
            case 4:
                self.updateTextView(.leftAlign)
                
            case 5:
                self.updateTextView(.centerAlign)
                
            case 6:
                self.updateTextView(.rightAlign)
                
            
            default:
                print("error")
            }
        }
        
        
        
    }
    
    func updateTextView(_ index : EditDescription){
        switch index{
            
        case .bold:
            handleBold()
        case .italic:
            handleItalic()
        case .underline:
            handleUnderline()
        case .leftAlign:
            handleLeftAlign()
        case .rightAlign:
            handleRightAlign()
        case .centerAlign:
            handleCenterAlign()
        case .link:
            handleLink()
        }
    }
    
    func handleBold(){
        guard let currentAttributedText = descriptionTextView.attributedText?.mutableCopy() as? NSMutableAttributedString else {
                return
            }
        
        
        if let selectedRange = descriptionTextView.selectedTextRange {
                    let startPosition = descriptionTextView.offset(from: descriptionTextView.beginningOfDocument, to: selectedRange.start)
                    let endPosition = descriptionTextView.offset(from: descriptionTextView.beginningOfDocument, to: selectedRange.end)

            currentAttributedText.addAttribute(.font , value: UIFont.boldSystemFont(ofSize: 15), range: NSRange(location: startPosition, length: endPosition - startPosition))
            descriptionTextView.attributedText = currentAttributedText
        
            
        }
    }
    
    func handleItalic(){
        guard let currentAttributedText = descriptionTextView.attributedText?.mutableCopy() as? NSMutableAttributedString else {
                return
            }
        
        
        if let selectedRange = descriptionTextView.selectedTextRange {
                    let startPosition = descriptionTextView.offset(from: descriptionTextView.beginningOfDocument, to: selectedRange.start)
                    let endPosition = descriptionTextView.offset(from: descriptionTextView.beginningOfDocument, to: selectedRange.end)

            currentAttributedText.addAttribute(.font , value: UIFont.italicSystemFont(ofSize: 15), range: NSRange(location: startPosition, length: endPosition - startPosition))
            descriptionTextView.attributedText = currentAttributedText
        
            
        }
    }
    
    func handleUnderline(){
        guard let currentAttributedText = descriptionTextView.attributedText?.mutableCopy() as? NSMutableAttributedString else {
                return
            }
        
        
        if let selectedRange = descriptionTextView.selectedTextRange {
                    let startPosition = descriptionTextView.offset(from: descriptionTextView.beginningOfDocument, to: selectedRange.start)
                    let endPosition = descriptionTextView.offset(from: descriptionTextView.beginningOfDocument, to: selectedRange.end)

            currentAttributedText.addAttribute(.underlineStyle , value: NSUnderlineStyle.single.rawValue, range: NSRange(location: startPosition, length: endPosition - startPosition))
            descriptionTextView.attributedText = currentAttributedText
        
            
        }
    }
    
    func handleLeftAlign(){
        guard descriptionTextView.attributedText?.mutableCopy() is NSMutableAttributedString else {
                return
            }
        
        
        if let selectedRange = descriptionTextView.selectedTextRange {
            
            if let lineRange = descriptionTextView.tokenizer.rangeEnclosingPosition(selectedRange.start, with: .line, inDirection: .layout(.left)) {
                        // Set text alignment to right for the line containing the cursor
                descriptionTextView.textStorage.addAttribute(.paragraphStyle, value: createParagraphStyle(textAlignment: .left), range: NSRange(location: descriptionTextView.offset(from: descriptionTextView.beginningOfDocument, to: lineRange.start), length: descriptionTextView.offset(from: lineRange.start, to: lineRange.end)))
                    }
        
            
        }
    }
    
    func handleRightAlign(){
        guard let currentAttributedText = descriptionTextView.attributedText?.mutableCopy() as? NSMutableAttributedString else {
                return
            }
        
        
        if let selectedRange = descriptionTextView.selectedTextRange {
            
            if let lineRange = descriptionTextView.tokenizer.rangeEnclosingPosition(selectedRange.start, with: .line, inDirection: .layout(.right)) {
                        // Set text alignment to right for the line containing the cursor
                descriptionTextView.textStorage.addAttribute(.paragraphStyle, value: createParagraphStyle(textAlignment: .right), range: NSRange(location: descriptionTextView.offset(from: descriptionTextView.beginningOfDocument, to: lineRange.start), length: descriptionTextView.offset(from: lineRange.start, to: lineRange.end)))
                    }
        
            
        }
    }
    
    func handleCenterAlign(){
        guard let currentAttributedText = descriptionTextView.attributedText?.mutableCopy() as? NSMutableAttributedString else {
                return
            }
        
        
        if let selectedRange = descriptionTextView.selectedTextRange {
            
            if let lineRange = descriptionTextView.tokenizer.rangeEnclosingPosition(selectedRange.start, with: .line, inDirection: .layout(.right)) {
                        // Set text alignment to right for the line containing the cursor
                descriptionTextView.textStorage.addAttribute(.paragraphStyle, value: createParagraphStyle(textAlignment: .center), range: NSRange(location: descriptionTextView.offset(from: descriptionTextView.beginningOfDocument, to: lineRange.start), length: descriptionTextView.offset(from: lineRange.start, to: lineRange.end)))
                    }
        
            
        }
    }
    
    func handleLink(){
        guard let currentAttributedText = descriptionTextView.attributedText?.mutableCopy() as? NSMutableAttributedString else {
                return
            }
        
        
        if let selectedRange = descriptionTextView.selectedTextRange {
                    let startPosition = descriptionTextView.offset(from: descriptionTextView.beginningOfDocument, to: selectedRange.start)
                    let endPosition = descriptionTextView.offset(from: descriptionTextView.beginningOfDocument, to: selectedRange.end)

            currentAttributedText.addAttribute(.link , value: URL(string: "https://www.google.com")!, range: NSRange(location: startPosition, length: endPosition - startPosition))
            descriptionTextView.attributedText = currentAttributedText
        }
    }
    
    @objc func handleKeyboardShow(keyboardShowNotification notification: Notification){
        CreateNoteViewController.isKeyboardOnScreen = true
        
        if let userInfo = notification.userInfo,
                // 3
                let keyboardRectangle = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
//            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut) {
//
//            }
            
            editDescriptionView.frame = CGRect(x: (view.frame.width - editDescriptionView.frame.width)/2, y: keyboardRectangle.minY - 40 + 250, width: 350, height: 33)
            
            self.view.addSubview(editDescriptionView)
            editDescriptionView.layer.shadowRadius = 8
            editDescriptionView.layer.shadowColor = UIColor.black.cgColor
            editDescriptionView.alpha = 0
            editDescriptionView.transform = CGAffineTransform(translationX: 0, y: 10)
            
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut) {
                self.view.transform = CGAffineTransform(translationX: 0, y: -250)
                self.editDescriptionView.alpha = 1
                self.editDescriptionView.transform = .identity
            }
            

            
            }
            
    }
    
    @objc func handleKeyboardHide(keyboardShowNotification notification: Notification){
        CreateNoteViewController.isKeyboardOnScreen = false
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            self.editDescriptionView.alpha = 0
            self.editDescriptionView.transform = CGAffineTransform(translationX: 0, y: 10)
            self.view.transform = .identity
        }, completion: { _ in
            
            self.editDescriptionView.removeFromSuperview()
        })
        
    }
    @objc func appMovedToBackground(){
        print("gya")
        descriptionTextView.resignFirstResponder()
    }
}


extension UIImage {

    func addImagePadding(x: CGFloat, y: CGFloat) -> UIImage? {
        let width: CGFloat = size.width + x
        let height: CGFloat = size.height + y
        UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: height), false, 0)
        let origin: CGPoint = CGPoint(x: (width - size.width) / 2, y: (height - size.height) / 2)
        draw(at: origin)
        let imageWithPadding = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return imageWithPadding
    }
}
